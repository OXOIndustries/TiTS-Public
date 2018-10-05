//Bored Jumper Gangbang
//by William

//This is an outline of a random gangbang on Zheng Shi that will take place if the player has released the slaves under Maike’s purview.
//Bored Jumpers will be getting sexed by the slaves while the player watches, or the player can join and/or take over.


//Add to Zheng Shi Mines Random Encounters
// After Defeating Maike and releasing the slaves, this repeatable encounter can be seen rarely wandering around the Mines. Tentatively, 1/14 encounters on average? Should be reasonably accessible.
// One of the four Jumpers will be found in a sexy predicament with three other slaves. For genders, will have at least one dick and one pussy in play.
// Player can watch it unfold, or join in and take the lead. Leaving results in a lust spike.
// Some interactivity for the player: can choose to have fun with the slaves during or only focus on the Jumper.

public function showJumpyGangbang():void
{
	showName("\nGANGBANG");

	//Bust gen
	var busts:Array = [];
	if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) busts.push("BORED_JUMPER_EQUINE_NUDE");
	else if(enemy.hasCock(GLOBAL.TYPE_FELINE)) busts.push("BORED_JUMPER_FELINE_NUDE");
	else if(enemy.hasCock(GLOBAL.TYPE_CANINE)) busts.push("BORED_JUMPER_CANINE_NUDE");
	else busts.push("BORED_JUMPER_TERRAN_NUDE");
	busts.push("GRYVAIN_ORGY_GIRL");
	busts.push("SAERI_ORGY_GIRL");
	busts.sort(randomizeBusts);
	showBust(busts[0],busts[1],busts[2]);
	
	//Author
	author("William");
}

public function randomizeBusts(a:String,b:String):Number
{
	if(rand(2) == 0) return 1;
	return -1;
}

//REQUIRE GENITALIA!
public function boredJumperGangbangProc():Boolean
{
	setEnemy(new JumperBored());
	showJumpyGangbang();

	// First Time
	if(flags["JUMPER_GANGBANGS"] == undefined)
	{
		output("\n\nYour temperate contemplation is broken by screams and moans in one direction. Make that two... No, every direction - damn, there are voices of lust clamoring all at once! Either you just walked into the center of an enviable orgy or there are more than a few people having a good time just out of sight. ");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 50) output("And if others are having a good time, why aren’t you? Better question, why the <b>hell</b> weren’t you invited? ");
		output("Readying your [pc.weapon] in case of the worst - you never know when a clunker is going to break one of the laws of robotics around here - you make your way to the libidinous symphony.");
		output("\n\nThe louder it gets, the more content you are that you’ve chosen wisely. Around the next jagged bend, you lay your [pc.eyes] on a sight to behold. On the ground, three slaves, free of their indenturement, crowd around a slick, fuzzy figure. A nude laquine jumper, one of many horny, hopped up pirates that come around looking for a sweaty fuck just found it. The way one of them fingers her pussy with wild need and the others assault her huge tits and wanton O-face, you’re sure they could fill a bathtub with the sweat they’ve each worked up.");
		output("\n\nEven though the [enemy.furColor]-furred horny herm is on the receiving end of curses and some slaps, the fierce sex makes her sound like the happiest bitch this side of the frontier. Her [enemy.cock] bobs up and down, the potent musk reaches you as pre beads from her [enemy.cockHead]." + (pc.libido() >= 66 ? " You look down to see your [pc.hand] worming its way into your [pc.thighs] unbidden, swimming in the swampy heat you’re generating from this sight.":""));
		// PC not taur
		if(!pc.isTaur()) output("\n\nIt occurs to you that you could just watch this unfold and see where it goes from here. Or, perhaps, you could join in!" + (pc.libido() >= 50 ? " After all, you freed the slaves around here! That entitles you to some <i>fucking</i> good times, right?":""));
		// PC taur
		else output("\n\nIt occurs to you that you could see where this goes from here. With how steamy it’s getting, you could probably cum from watching long enough!" + (pc.libido() >= 50) ? " Besides, you freed the slaves around here! That entitles you to a good time, right?":"");
	}
	// Repeat Time
	else
	{
		output("\n\nYou find yourself captivated by a familiar music: moans and pleasured yelps echo through the coal-black corridors, letting you know loud and clear that the former slaves of this station have found themselves another lawless laquine. Or, perhaps she found them? You needn’t go far to stumble on that spontaneous orgy. Just up ahead, hidden by the dim haze of cheap lamplight and sweltering air, you find three slaves who have undone their sleeveless suits, forcing a pirate bunny to pleasure them.");
		output("\n\nThe laquine at their mercy, held by her ears, is vigorously molested and teased by the lusty mob. Two grind their crotches against the nude rabbit’s face, aimlessly assaulting their eager slut’s brown-furred body wherever their hands can reach." + (pc.libido() >= 50 ? " Like before, you find yourself idly masturbating at the sight of uninhibited sex, promising to be just as fierce as last time. Your [pc.hand] swims in the heat you’re generating just viewing this saccharine sight.":""));
		output("\n\nYou see the choices in front of you once again, just like you see the jumper’s [enemy.cock] flopping around with translucent strands of sticky cum clinging to the tip. " + (!pc.isTaur() ? "Will you join this impromptu gangbang, just watch, or move on?":"Will you stick around and see where this goes, or get going?"));
	}
	IncrementFlag("JUMPER_GANGBANGS");
	clearMenu();

	if(!pc.isTaur()) addButton(0,"Join",joinTheOrgyShit,undefined,"Join","Step in and take the Jumper to pound town!");
	else addDisabledButton(0,"Join","Join","As a ‘taur, you can’t really interlock with these bipedal sluts.");

	if(pc.cockThatFits(enemy.vaginalCapacity(0)) < 0 && !pc.hasHardLightEquipped()) addDisabledButton(1,"Take Over","Take Over","You need a penis that can fit inside one of the slaves or a hardlight-equipped pair of undies in order to do this.");
	else addButton(1,"Take Over",takeOverTheGangbang,undefined,"Take Over","You’re going to be conducting this. Get on the Jumper and dole out the roles.");

	addButton(2,"Watch",watchSomePirateGanguBanguSlanguWangu,undefined,"Watch","On a pirate station, you’re pretty sure voyeurism is <i>encouraged!</i>");
	
	addButton(14,"Leave",leaveDatOrgyBehind);
	return true;
}

//[Join]
// Tooltip: Step in and take the Jumper to pound town!
// Tooltip, grayed out taur: As a ‘taur, you can’t really interlock with a bipedal slut.
// Unavailable to ‘taurs
// PC may end up with a variety of Aftersex-FX™
// Interactivity focused, shorter scenes for more agency.
public function joinTheOrgyShit():void
{
	clearOutput();
	showJumpyGangbang();
	output("A hand on your chin, a heavy breath, you already feel your [pc.crotch] agreeing with the notion of participating in sultry, sweaty sex. Whether you be on top or bottom, this promises to be some of the hottest sex you’ll ever have.");
	output("\n\nBefore you reveal yourself, you get a good look at this porn video in the making, seeing which actors are in play - it looks like it’s just about to start no less! The most obvious is a very tall, jade-scaled gryvain sporting two twitching wyrm-cocks. The second is a husky, chocolate-skinned terran girl with short red hair and a...");
	output("\n\nYou step closer to get a better look at the twilight skinned figure, knowing you’ll be seen before long. ");
	if(CodexManager.entryUnlocked("Saeri")) output("It’s a saeri! Her... <i>his</i> two large butterfly wings extend behind his petite yet well-toned body, leaving no doubt as to his heritage.");
	else 
	{
		output("You aim your codex at the petite, well-toned girl...<i>boy</i>. It intones his race soon enough: a saeri, a species of siel that resemble butterflies. Indeed, there’s no doubt seeing those two dazzling wings spread behind his back.");
		CodexManager.unlockEntry("Saeri");
	}
	output(" The saeri’s sizeable schlong rests warmly in the laquine’s greedy mouth, every swirl of her stimulating tongue evoking his sonorous moans.");
	output("\n\nThe imposing gryvain notices your approach, eyeing you with a mix of suspicion and lust. She half raises her scaly arm, only to grunt when the pirate squeezes both of her dicks in one paw. The cottontail’s other mit cups the redhead’s soggy pussy in a manner that makes your legs clench. Under their collective moans, you clear your throat...");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Heyy! Couldn’t help but notice you’ve got something going on. You don’t mind if I join, do ‘ya?”</i> You call in a sing-song voice" + (!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed() ? ", shucking your [pc.gear] with obscene efficiency":"") + ".");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“I see you’re having fun. Room for one more?”</i> You grin, patting your crotch" + (!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed() ? " and shucking your [pc.gear] with obscene efficiency":"") + ".");
	// PC Kind
	else if(pc.isNice()) output("\n\nYou put your weapons down gently" + (!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed() ? " and start disrobing":"") + ". <i>“You wouldn’t mind an extra, would you? Seeing this got me kind of turned on.”</i> You say.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\nYou make a quick show of peace, putting your weapons aside" + (!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed() ? " and slipping out of your [pc.gear]":"") + ". <i>“Alright, now that I’m here, this is gonna get real dirty. Step aside!”</i>");
	// PC Hard
	else output("\n\nYou raise a hand and put your weapons to the side. <i>“Alright, make room.”</i> You call out" + (!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed() ? ", shaking yourself free of your [pc.gear]":"") + ".");

	output("\n\nThe group of slaves, still glancing at you warily, let you [pc.walk] closer in silent invitation. You’re not a pirate, that much they can discern, but you’re definitely not a slave" + (pc.armor is Slavesuit ? " that they recognize":"") + ". Still, they’re willing to see where it goes now that you’re here and not trying to chain them up again.");
	output("\n\nYou’ve already got a lot in mind, and all the racy thoughts surfacing in your hormonally charged cortex involve that busy bunny being used as the best fuzzy fuck puppet ever born. Far from being unhappy, she looks <i>very</i> excited to see you stepping over. Good, because you’re about to make her cum her brains out of that [enemy.cock] of hers.");
	output("\n\nThe only question now: how do you go about that? You could fall in with her and get fucked all the same, using her as leverage, or you could pound her laquine ass until she’s unable to walk.");
	processTime(15);
	pc.lust(12);
	clearMenu();
	addButton(0,"Mount Her",mountHerOrgy,undefined,"Mount Her","Get in the middle of the gangbang and on top of the Jumper. Maybe the other slaves can scratch your itch, too?");
	//addButton(1,"Take Over",,undefined,"Take Over","");
	addDisabledButton(1,"Take Over","Take Over","This is not yet coded.");
}

//[Mount Her]
// Tooltip: Get in the middle of the gangbang and on top of the Jumper. Maybe the other slaves can scratch your itch, too?
public function mountHerOrgy():void
{
	clearOutput();
	showJumpyGangbang();
	output("With a beating heart");
	if(!pc.isHerm()) output(", ");
	if(pc.hasCock() && !pc.hasVagina()) output(" and a throbbing penis");
	else if(pc.hasVagina() && !pc.hasCock()) output(" and a tingling pussy");
	else output("a throbbing penis and a tingling pussy");
	output(", you [pc.walk] over to and sit near the kneeling laquine servicing the gryvain-human-saeri mix so diligently. You catch your breath at the center of this sexual tsunami, a lump forming in your throat. You’re already drooling! Four raw and ready dicks pollute the air with womb-rippling musk, and the human-gryvain pheromone combo makes all proudly flared manhoods flood their stiff shafts with salty, sticky pre, flowing out as if the room itself is sucking them off.");

	output("\n\nYou take a deep breath and feel the sparks of aerial lust stoke a blaze in your body. It was a smooth inhalation, a simple act... But your exhalation is less so. A ragged, growling breath follows; your body shivers and trembles with the stench of horny, capable breeders subverting its perfunctory purposes. Your eyes almost water as the wavy haze of concentrated libido comes into faint view under the cheap lights, enveloping the mixed phalli on display in a sweet, soupy glow that begs you to touch, stroke, suck, kiss, fuck-");
	output("\n\n<i>Will this fucking rabbit share the cock already?!</i>");

	output("\n\nYour breaths turn to rapid pants as your [pc.face] flushes red - a sheen of sweat layers your naked body. ");
	if(pc.isHerm()) output("[pc.EachCock] and [pc.eachVagina] tighten with every embery breath, your body soon submitting to the orgiastic cloud you’ve placed it in and demanding its place atop.");
	else if(pc.hasCock()) output("[pc.EachCock] agrees with your position, standing at the same attention the laquine’s does.");
	else if(pc.hasVagina()) output("[pc.EachVagina] clenches and contracts being surrounded by so many potent poles that could stretch it wide and fill it full.");
	else output("Your heart beats faster and faster; a tugging spasm in your groin clears your head for but a moment.");
	output(" Craning your neck to the brown-furred laquine, you curse and tackle her to the ground, yanking the gryvain and saeri around. The terran grouses too, having lost her whiskered dildo.");

	output("\n\nYou tumble down on the elated fuckbunny, landing with your head in her sweaty cleavage. <i>“Oh woah!”</i> She shouts, landing with a wet clap. <i>“Didn’t think y-”</i> You pinch her munchable nipples");
	if(pc.biggestTitSize() >= 1) output(", squishing her pert sweatglobes against yours,");
	output(" and shut her up with a forceful kiss. You grind ");
	if(pc.hasCock()) output("your [pc.cocks]");
	else if(pc.hasVagina()) output("your [pc.vaginas]");
	else output("your belly");
	output(" against her tensing [enemy.cockNounSimple]. The lingering taste of saeri-flavored musk on the bewildered laquine’s tongue takes you to another level of arousal, and you practically chew on her confused kisser." + (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) ? " You force your [pc.tongue] deeper in the rabbit slut’s mouth, clutching her head like a fuzzy pearl while you mix your lust venom into the kiss. Animalistic groans muffled between your [pc.lips] and hers make every limb shiver in erotic anticipation, potent venom soaking into her gums.":""));
	output("\n\nYou hear and feel the saeri boy pouting, moving up next to your heads - lavishing you with gentle caresses up and down your [pc.ass] and arching back - while the gryvain shuffles to your rear. <i>“W-would you?”</i> The glowing saeri boy asks with a tugging innocence to his voice. You look up from your messy kiss to see his turgid, rippled dick bobbing just in front of your nose. <i>“If it’s no trouble, I’ve gotten... umm...”</i>");
	output("\n\nAlmost as cute as he is, it’s about eight inches long, pulsing with every heartbeat between you and the laquine. Before you can react, the pirate gobbles up the fleshy pink tip, slurping on it like it’s her favorite lollipop. Holding to her head he drops to his knees, balls rubbing her lush hair, while she bobs and sucks despite your presence atop her.");
	output("\n\nThe dark-skinned redhead stares at you pointedly, eyes dim with lust, crotch thrust out with her pink pussy spread near your mouth. A whiff of her intoxicating, honey-scented smell - aside from get you horny as hell - makes you think she’s in heat! Knowing what’s asked, your [pc.tongue] flits out and tastes all around her vulva, the tip teasing her clit and cleaning her of liquid arousal." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " You manage to extend your tongue all the way through her creamy, chocolate thighs and up the canyon of her butt, tasting at her supple sphincter and rocking the base of your alien organ past her pussylips.":"") + " The pleasant whimpers and two soft hands " + (pc.hasHair() ? "threading between your [pc.hairs]":"softly squeezing your head") + " urge you further in.");
	// PC not Naga
	if(!pc.isNaga()) output("\n\nThe emerald gryvain, not to be left out, jerks her dual endowments while rubbing one tapered tip against the pirate’s horse twat and the other between your [pc.ass]. She grips your [pc.hips] and starts humping, one cock pistoning between your crotches and the other hotdogging you, her mighty girth rubbing forcefully against your [pc.asshole]. She " + (pc.tailCount > 1 ? "pets your pheromone fanning [pc.tails]":"pats your sweaty [pc.butt]") + " before leaning back and aligning her dicks with two wet, waiting holes...");
	// PC naga
	else output("\n\nThe jade gryvain, not to be left out, lifts your [pc.leg] and yanks your scaly coils aside to reach the pirate’s musky nethers. Realizing what she wants, you slither your snake-half under and around the jumper’s body, wrapping her up in your constricting embrace and baring her crotch to the plundering dragon. You feel her rub her cocks against your butt before falling down to the rabbit’s...");
	processTime(20);
	pc.lust(100);
	clearMenu();
	if(pc.isNaga()) addDisabledButton(0,"Let Her","Let Her","You can’t get reamed with the jumper in your snake form!");
	else addButton(0,"Let Her",letHerGangbangSlaveStuff,undefined,"Let Her","Let the dragon-slut use your butt while you service the others.");
	addButton(1,"Don’t Let Her",dontLetHerOrgy,undefined,"Don’t Let Her","Don’t let her in. In fact, you could switch things up a bit...");
}

//[Let Her]
// Tooltip: Let the dragon-slut use your butt while you service the others.
// Tooltip, if naga: You can’t get reamed with the jumper in your snake form!
// Unavailable to Naga
public function letHerGangbangSlaveStuff():void
{
	clearOutput();
	showJumpyGangbang();
	if(pc.tailCount > 0) output("Moving your [pc.tails] out of the way, y");
	else output("Y");
	output("ou reach a [pc.hand] back and spread your [pc.ass] for the dragon herm. ");
	if(pc.libido() < 33) output("<i>“Alright... Go easy at first!”</i> You call.");
	else if(pc.libido() < 66) output("<i>“Yeah, just like that! Don’t be afraid to get rough!”</i> You nearly shout.");
	else output("<i>“Yes! Don’t you dare go slow! If you’re feelin’ adventurous, stick both in while you’re at it!”</i> You howl with as sexy a voice as is manageable.");
	output("\n\nYour [pc.asshole] reflexively tightens when tapered wyrm cock comes knocking. Thanks to the sweat-pre mix, she slips in despite the modicum of resistance your rectum applies. A shrill moan surges up from your throat and your oral servicing falters just feeling the tip rub against your most sensitive flesh. The gryvain plants her fingers on your [pc.hips] as you’re brought to sudden orgasm!");
	pc.buttChange(200);

	output("\n\n<i>“Aw fuck YES! Now you’re getting into it!”</i> The laquine rubs your ass further into your conqueror’s cock, the shocks running through your pelvis making your toes curl painfully.");

	if(pc.isHerm()) output("\n\nYour [pc.cocks] and [pc.pussy] feel a similar tug and loss of control as [pc.cum] and [pc.girlCum] spurts between spongy fur and scaly legs.");
	else if(pc.hasCock()) output("\n\nYour [pc.cocks] bloat" + (pc.cockTotal() == 1 ? "s":"") + " and swell" + (pc.cockTotal() == 1 ? "s":"") + ", spurting [pc.cum] all over your furry spunk sponge’s tummy.");
	else if(pc.hasVagina()) output("\n\nYour [pc.pussy] strangles an invader not there and " + (pc.isSquirter() ? "squirts":"coats") + " three pairs of quaking thighs with a boiling batch of [pc.girlCum].");
	output(" Your [pc.ass] spasms, the clenching walls doing more to draw all 10 inches of knotty dragon dick in than keep it out.");

	output("\n\nAt the same time you’re cumming, you also feel the jumper’s [enemy.cock], nestled " + (pc.hasCock() ? "under yours":"between your bellies") + " thrumming with every thick heartbeat as one of the gryvain’s breeding knobs rub against her oh-so-pinchable clit. Eyes rolling back, she wails in pleasure and groans with a lolling tongue while her [enemy.cockNounSimple] smears a warm stream of cum on the two of you! The beatific saeri boy, left to himself, looks to you with dazzling eyes under shimmering black hair. <i>“I’m about to cum, please!”</i> he whines with a knuckle over his mouth.");

	output("\n\nGasping with both [pc.hands] on the laquine’s fat [enemy.nippleColor] nipples, you tug and twist her huge pillowy breasts <i>hard</i>. You wrench your [pc.tongue] off the redhead’s simmering quim, unaware that half a jar of honey-cum has been slathered on your [pc.face] during that mind-muddling orgasm. With a puddle of her sweet, modded fem juice in your mouth, you " + (!pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "lash your honey-soaked tongue at the saeri’s fleshy pink cockhead":"whip your honey-soaked tongue around his entire shaft like a snake coiling its prey, jerking it") + " before mimicking the slut-bun’s skillful fellatio. Cooing in delight, the saeri rubs his elegant fingers " + (pc.hasHair() ? "through your [pc.hairs]":"over your head") + " with tender grace.");

	output("\n\nMaking sure the sweaty redhead doesn’t get bored, you crimp your fingers and shift into a slightly more comfortable pose as is possible with an intense, double-dicked dragon pistoning in and out of you. A rough tug later, you pinch both of the laquine’s tits in one hand and all but ram the other into the redhead’s hot twat. The poor girl crumples with a loud, erotic wail, her descent downward only spearing herself to your ");
	if(pc.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) output("armored");
	else if(pc.hasArmFlag(GLOBAL.FLAG_FURRED)) output("furry");
	else if(pc.hasArmFlag(GLOBAL.FLAG_SCALED)) output("scaly");
	else if(pc.hasArmFlag(GLOBAL.FLAG_GOOEY)) output("gooey");
	else output("smooth");
	output(" knuckle. Wriggling your hand like a vibrator, you drag your thumb back and forth over her clitty and wring out more and more boiling trickles of femlube while you suck on the saeri boy’s prick like a well-trained slut.");

	output("\n\nWith your [pc.eyes] focused on the cute butterfly boy, you bring his alien manhood into your wet throat with very little effort. All the pre and satin saeri spunk dribbling out of his twin cumslits has made your mouth into an exotic leisure experience. Not just for him, but for you - he tastes <i>amazing</i>! With your hands still busy dual-wielding a pair of incorrigibly horny bitches, you " + (!pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "swirl your [pc.tongue] around his segmented shaft with every thrust of his hips":"keep his segmented shaft wrapped in your [pc.tongue] and even knead his bulky sack, juggling his nuts with the tip of your impressive organ") + " while he cries out in bliss above. " + (pc.hasLongEars() ? "He looks down and scratches at your flexing [pc.ears] in response to your expert blowjob - it’s an affection he’s glad you receive with a smile. ":"") + "<i>“T-that’s..! Please keep doing that! I’ll cum wherever you want, " + pc.mf("sir","ma’am") + "!”</i>");
	output("\n\nHowever did he end up here?" + (flags["MET_TIVF"] != undefined ? " Then again, you <i>did</i> meet Maike’s favorite bee boy...":"") + " Oh well, all that matters is he’s invested in what’s going on, and he tastes delicious!");
	output("\n\nThe jumper finally begins to squirm. Once languid hands now find strength, reaching up to " + (pc.biggestTitSize() >= 1 ? "your [pc.breasts]":"your [pc.ass]") + " and roughly groping at wherever her dainty digits can travel." + (pc.hasVagina() ? " You again become intimately aware of her 13-inch pride. Her hips start thrusting upward to match the draconic woman’s womb-kissing lunges, rubbing her base against your [pc.pussy] too.":""));
	output("\n\n<i>“I need more c’moonnn... Don’t leave me out! Even like this I can fuck c’monc’mon!”</i> The rabbit whines, upset that her roles have been commandeered.");
	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Service",serviceTheJumperOrally,undefined,"Service","Focus on oral service with the jumper and get splattered!");
	if(pc.hasVagina()) addButton(1,"Ride Her",vaginaRouter,[rideHerGangbangOption,enemy.cockVolume(0),0,0],"Ride Her","This fuckdrunk rabbit has a place she could be, in fact...");
	else addDisabledButton(1,"Ride Her","Ride Her","You need a vagina for the bun to slot in.");
}

//[Service]
// Tooltip: Focus on oral service with the jumper and get splattered!
public function serviceTheJumperOrally():void
{
	clearOutput();
	showJumpyGangbang();
	output("You withdraw from the saeri’s cock with a flourish of the tongue. You beckon him closer to your mouths, telling him to put it right between your [pc.lips] and her [enemy.lipColor] pillows. When his plush prick is set so warmly between you and the silly-fucked rabbit, he can’t help but howl euphorically as two eager mouths pepper his prong with fiery kisses. Sucking against his spit-slicked crown, you kiss each other around his puffy phallus, tongues vying for more and more of the butterfly’s savory member.");
	output("\n\nBehind you, the gryvain’s pleasured moans shift into animalistic bellows as she rails your [pc.asshole] and the bunny’s cunny faster and faster. She’s risen to a squat, fucking you so hard that your feet are dangling helpless under her four wings. The vibrations in her four nads send a bouncing electrical signal through every nerve ending in your body that she’s about to use your bodies as the canvas for her magnum opus. The pirate knows it too. Her gyrating hips not only amplify that draconic pleasure, but also her own: her musky member rolls like an overcooked sausage between your tummies, smearing ejaculate into your belly" + (pc.hasCock() ? " and your [pc.cocksLight]":"") + ".");
	output("\n\n<i>“Move over!”</i> the redhead barks, pushing the cobalt boy aside. Your entranced lip service is momentarily broken as she thrusts her needy crotch into the pocket of oral heaven. <i>“Me too, I need to cum! Hurry up!”</i>");
	if(pc.libido() < 33) output("\n\n<i>“No need to push, I’ll take care of you...”</i> You murmur, putting your [pc.lipsChaste] to her button.");
	else if(pc.libido() < 66) output("\n\n<i>“There’s plenty of mouth to go around, babe.”</i> You half-giggle in a lust-drunk stupor.");
	else output("\n\nYou nibble on her clitty, thrusting your tongue back in her sweet, hot folds. <i>“No proh-blem!”</i> you mime.");
	output(" You move both of your [pc.hands] up to tend the jutting crotches in your [pc.face], fingers already targeting high value erogenous zones.");
	output("\n\nWith a little maneuvering, you and your bunny slut get easy access to pussy, cock, and balls, those saccharine genitals rubbing into each other with noisy schlicks - an orgy within an orgy. This confined space fast becomes a pheromonal philharmonic, fingers in full swing.");
	output("\n\nAs the laquine tongues the plums blocking her eyes, you help his cock rub into the redhead’s pussy on every outstroke. He grabs the laquine’s slippery ear, announcing his orgasm. His sexually-charged moans set off the chain reaction of orgiastic release, starting with the horny herm whose [enemy.cock] has been grinding against you the whole time.");
	output("\n\nThe gryvain screams as her pleasure peaks. Molten goo sloughs inside your anus, spattering your numb bum with every eruption. The feel of her urethra bulging with cum adding to the stretch on your [pc.asshole] makes you cum as well");
	if(pc.isHerm()) output(" your [pc.cocks] and [pc.vaginas] dribbling at first before bursting like a fractured dam, painting the bunny with [pc.cum] and the weakening gryvain with [pc.girlCum]");
	else if(pc.hasCock()) output(" your [pc.cocksLight] spurting [pc.cum] from their [pc.cockHeads] in short to long ribbony bursts");
	else if(pc.hasVagina()) output(" your [pc.pussy] squirting [pc.girlCum] onto the gryvain’s weakening thighs");
	output(".");

	output("\n\nThe redhead and saeri boy both splooge in and on your mouth. Glops of honey and ultra-sticky fuckterfly cum bridge the gaps between their urethras, you, and the space between you and the jism-pregnant rabbit. With a whimper and a mouthful of sex, your whole body rattles and you collapse on the pirate slut below who merely catches you in a weak hug. Fading, pleasured revelry fills your [pc.ears] as the gryvain pulls her half-deflated knot out of your ass...");

	//cum in ass
	processTime(20);
	pc.orgasm();
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.cumType = GLOBAL.FLUID_TYPE_CUM;
	pp.createPerk("Fixed CumQ", 1000, 0, 0, 0);

	pc.loadInAss(pp);
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",serviceTheJumperOrally2);
}

public function serviceTheJumperOrally2():void
{
	clearOutput();
	showJumpyGangbang();
	output("You come to a few minutes later. Before your eyes open, there’s a hard, salty taste dancing on your taste buds. A unique, pleasant stench fills your nostrils. Once your eyelids peel open, you’re face to face with the lawless laquine who idly gropes at your " + (pc.biggestTitSize() >= 1 ? "[pc.breasts]":"[pc.ass]") + ". When she sees you awake, she ceases her kiss.");
	output("\n\n<i>“Hey cutie, ready for another round?”</i> The silly slut grins at you. Sighing, you press your hands to her shoulders and roll off. That act turns out to be a mistake, as the once confined stench of dried cum is freed, making you feel randy all over again. With another breath of polluted air, you stand up and look around for your belongings, glad to see they’re all still where you left them.");
	output("\n\n<i>“Aw-nowaitaww come on nooo!”</i> The jumper reaches out lamely, <i>“I wanna fuck mooooree!”</i>");
	output("\n\nIt’s a pitiful sight, to be sure. She can’t even move her legs and her [enemy.cockNounSimple] is soft and limp! She gives up with a miserable huff, only to grumble aloud soon after: <i>“Dammit, they took all my stuff! I’m gonna get reamed for this!”</i>");
	output("\n\nWhile you get on your way, you point out that she already did, eliciting a laugh that fades in time with the unrecorded porn you were in. Before you head down the corner, you spot a strange snake-like figure chasing after another set of figures further on...");
	processTime(5);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Ride Her]
// Tooltip: This fuckdrunk rabbit has a place she could be, in fact...
// Tooltip, no vagina: You need a vagina for the bun to slot in.
// Requires Vagina
public function rideHerGangbangOption(x:int):void
{
	clearOutput();
	showJumpyGangbang();
	output("The fatuous futanari makes a bold claim. Even like this she can fuck, huh? Time to test drive your new bike then!");
	output("\n\nYou cease your oral ministrations and rise, both hands on the laquine’s out-thrust nipples beading with moisture. You motion for the gryvain to stop and pull out. The act makes you shriek in reeling pleasure - pre flows like an unblocked stream from your [pc.asshole]. When you can move again, you squeeze the jumper’s [enemy.cock], baring a wide grin to her.");

	// PC Libido Low (<=33)
	if(pc.libido() <= 33) output("\n\n<i>“Alright, let’s see if you can live up to the hype.”</i> You smirk at the excited slut-bun, each sensuous flick of your wrist forcing out more globs of overflowing pre. Your lungs, clenched by the invisible vice of musk, deflate on your descent down the jumper’s [enemy.cock]. Your lips curl and your mouth spreads into a whorish O-shape. The lips of your [pc.pussy " + x + "] are parted by the laquine’s [enemy.cockHead]. It’s not long before you ease her into your molten depths." + (pc.vaginalVirgin ? " As numb as you are, and as pleasurable as it is sliding down her magnificent member, you hardly feel the tearing of your hymen.":""));
	// PC Libido Med (34-66)
	else if(pc.libido() <= 66) output("\n\n<i>“I’ll take you up on that offer!”</i> You announce, the excited slut-bun meeting your sultry gaze. Your rough jerking coaxes out long ropes of overflowing pre, the pearly ooze brought to your mouth as the [enemy.cock] is aligned with your [pc.pussy " + x + "]. Exhaling, your smile broadens as inch after inch of bunny dick is coaxed up the pleasurable passage to your waiting womb." + (pc.vaginalVirgin ? " As numb as you are, and as pleasurable as it is sliding down her magnificent member, you hardly feel the tearing of your hymen.":""));
	// PC Libido High (>=67)
	else output("\n\n<i>“About time you asked! I’m gonna ride you so hard you won’t ever stand again!”</i> You declare to the excited slut-bun, flecks of musk billowing with the drops of spittle from your messy mouth. Both [pc.hands] pump the jumper’s cock as you wage a vicious battle with your overstimulated body, desperate to calm it down so that you can give your [pc.pussy " + x + "] the [enemy.cock] it wants. You smile deliriously as her [enemy.cockHead] slips past your arousal-soaked folds with ease, " + (enemy.cockVolume(0) * 8 > pc.vaginalCapacity(x) ? "stretching your resistant":"sliding up your capacious") + " vaj." + (pc.vaginalVirgin ? " As numb as you are, and as pleasurable as it is sliding down her magnificent member, you hardly feel the tearing of your hymen.":""));
	// Merge
	pc.cuntChange(x,enemy.cockVolume(0));

	output("\n\nAwesome sensations course through your waist and groin - you know you’ve taken the laquine’s pride as deep as she will go in this position. You rise and fall on the pirate’s pelvis, eyes threatening to roll back from the sheer pleasure of being filled to the point that her cock is distending your belly. The gryvain’s pulsing dick rubs between your butt, waiting for an opportunity to reclaim its lost ground. The girl and the butterfly in front of you recapture the jumper’s attentions, their crotches thrust out to her mirey mouth. She sucks on cock and clit together, tongue lapping up all thick droplets of liquid arousal in reach.");

	output("\n\nWith every plunge down the [enemy.cockNounSimple] pushing your stomach out, you take your fuckbunny further inside and arch yourself down to her brown-furred belly. When your butt comes down far enough, you feel the gryvain shift up and skewer you on her cock again, your [pc.asshole] offering no resistance in its abused shape. You choke on the breath you take, feeling two different cocks in your body rubbing against each other as they plow your holes - a three-way massage in your most sensitive places!");

	output("\n\nYour brain on autopilot, you’re shoved back and forth by bunny and dragon cock, stretched ever so much wider, your body struggling to accommodate its girthy penetrators. Both hands on the laquine’s fat tits, you grit your teeth as more and more of her [enemy.cock] lunges inside, thrusting closer to your womb. When your cervix is smacked by her [enemy.cockHead], your grip on reality vanishes. You loose a squeal of pleasure as your hips crash into hers, desperate to cross the line to release; your pheromonal foundry bombards her cum factories with every thunderous impact of balls-deep breeding.");

	output("\n\nThe distinction of orgasm is apparent: your muscles lock and you’re hilted on the jumper’s cock. Your whole body trembles, shivering as if you’re naked in a storm, but these quakes are merely you stumbling through the door. When you take that last brave step, you scream out, thrusting your hips back to draw in as much cum as possible, looking down to your swelling belly. Your [pc.pussy " + x + "] and [pc.asshole] strangle their invaders" + (pc.totalVaginas() ? ", your extra cunts squirting out wave after wave of fem slime":"") + ". [pc.GirlCum] spurts from your [pc.pussy " + x + "]" + (pc.hasCock() ? ", your [pc.cocksLight] also firing off jets of cum that splatter the three in front of you.":""));

	output("\n\nYour orgasm triggers the detonation of every horny participant. The gryvain fires her bubbling payload into your ass and the laquine’s pussy simultaneously, the swelling of her urethra adding to the stretch on your poor hole. The jumper, too, cums <b>hard</b>, squirting the dragon bitch’s legs with mare musk and filling your womb with never ending ropes of laquine love. You feel her sloshing, fuzzy sack clenching, gradually emptying with every smooth thrust of her hips as the redhead and saeri coat her face in honey and silky saeri spooge.");
	output("\n\nGrunting loudly, you collapse into the pirate’s bosom. Your next pained exhortation sends you into a sweet nap smelling of sex.");
	processTime(30);
	pc.orgasm();
	pc.loadInCunt(enemy,x);

	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.cumType = GLOBAL.FLUID_TYPE_CUM;
	pp.createPerk("Fixed CumQ", 1000, 0, 0, 0);

	pc.loadInAss(pp);
	clearMenu();
	addButton(0,"Next",rideHerGangbangOption2,x);
}

public function rideHerGangbangOption2(x:int):void
{
	clearOutput();
	showJumpyGangbang();
	output("A soft humming stirs you from slumber. Your hands feel like they’re submerged in water. Eyelids jerking back you gasp, getting a sensory overload of lingering lust. You look up to see the [enemy.eyeColor] eyed bunny looking at you with a cute smile. <i>“Hey,”</i> she pats your head affectionately, <i>“was that fucking awesome or what?”</i>");
	output("\n\nYou chuckle softly, prying her furry melons apart and rolling off. You grimace feeling her flaccid [enemy.cockType] shaft slip out of you, a river of cum trailing down as you slump next to her. Feeling strength return, you jump up and stretch, leaving the paralyzed hare on the ground to reach out lamely. <i>“Aw daaaaaammmnnnn I can’t move!!”</i> She groans. <i>“I wanted another round, come onnnn! Moremoremore! Ahhh....”</i>");
	output("\n\nYou look around for your things, happy to see they’re all where you left them. Though you can’t see the jumper’s gear anywhere...");
	output("\n\n<i>“Dammit... I’m gonna get reamed for this!”</i> She curses, realizing her suit and weapons were all ‘appropriated’ by the slaves.");
	output("\n\nBefore you head off, you remind her that she just did, and to be grateful she still has her dick. Her fuckdrunk laughs follow you down the cavern.");
	processTime(20);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Don’t Let Her]
// Tooltip: Don’t let her in. In fact, you could switch things up a bit...
public function dontLetHerOrgy():void
{
	clearOutput();
	showJumpyGangbang();
	// PC not naga
	if(!pc.isNaga()) 
	{
		if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("You hide your [pc.asshole] with your [pc.tails], blocking her from going in. <i>“Not me, you’ve got two holes down there.”</i> You call out.");
		else output("You hurriedly thrust a hand to your [pc.ass] and cover your [pc.asshole]. <i>“Not me, you’ve got two holes down there.”</i> You call.");
		output(" Obviously disappointed, the gryvain realigns her first cock with the bunny’s pussy and the second with her obscured tailhole, ramming the laquine so hard that her inflating knots almost slip in.");
		output("\n\n");
	}
	pc.applyCumSoaked();
	// Merge
	output("You’re bounced up by the laquine’s bucking hips, her [enemy.cock] ballooning between your guts and shooting thick streams of white hot cum all over herself and your [pc.chest]. She’s blasting so hard that it lands on her own face! While she paints the sauna between your sandwiched bodies white, her pussy squirts off a few jets of fresh juice onto your knees and the gryvain’s ever-pounding wyrm-cock. The mollified love bun’s jaw slackens and her tongue lolls obscenely as the saeri boy’s member is evicted from its warm resting place, its rapid pulsing visibly slowing as his needs go unmet.");

	output("\n\nYou force ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("the base of ");
	output("your [pc.tongue] up into the redhead’s simmering slit");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", the tip of your kisser rimming and penetrating her ass.");
	output(" The taste of squeezed feminine love and <i>very</i> sweet cum trickles on your tongue. The saeri jerks himself idly, the bunny bitch beneath you having lost herself to the excesses of getting mercilessly double-stuffed. He sheepishly asks for you. However, before you can answer him, you gasp hot air as the redhead’s first orgasm washes over her and you. Sweet tasting honey, indicating some rather <i>delicious</i> mod work, drizzles into your mouth and pools on the flat of your taster. You swish your [pc.tongue] all around her velvety folds, lapping up every drop of ambrosial ooze with unfaltering accuracy.");
	output("\n\n<i>“W-would you?”</i> The shimmering black-haired boy looks into your eyes, pleading his desire with fluttering wings. Taking another breath of sultry fog, you almost giggle at the rocking rabbit’s delirious moans as she’s fucked from silly to stupid, molding to the curves of a libidinous riptide" + (silly ? " - she’s the boat, and you’re the sail. It’s time to chart a new course!":"."));
	output("\n\nLifting yourself up, you flip around and plant your crotch directly on the slut-bun’s fuzzy face. Your [pc.asshole] brushes up against the saeri’s cock" + (pc.buttRating() <= 11 ? ", just about engulfing him in copious amounts of [pc.ass]":", swallowing his dick up in between the cheeks of your [pc.ass]") + ". His hands are already on your butt, rubbing and caressing you with great praise as you rock your hips back and forth, hotdogging him in your expanse of ass. The pounding heartbeat in his rod grows stronger with every jolting rub to his glans; his dark, peach-sized balls rub over the rabbit’s nose");
	if(pc.hasVagina()) output(" and against your " + (pc.balls > 0 ? "[pc.balls] and ":"") + "[pc.pussy]");
	output(".");

	output("\n\nYou have full view of the gryvain pounding her laquine cocksleeve with hyperventilating pants. It’s a treat just to watch her big, perspiring tits jiggle this way and that, but the real prize is being face-to-face with the laquine’s [enemy.cock]. Her prodigious [enemy.cockType] pole is colored white with jumper’s jism and still lubricates itself like a faulty hydrant. On the next hard thrust, you’re bopped on the nose by her [enemy.cockHead], a smattering of her musky flavor filling your pheromonally strangled mind with longing desire. You half-whine, sucking at the tip and wondering why you aren’t deepthroating it yet.");

	output("\n\n<i>“Fuck... Move, you weird slut!”</i> The terran girl pushes you back from the pirate’s prick.");

	output("\n\nThe redhead, tired of lip service, and even more frustrated with not having a dick in this arrangement it seems, also mounts the bunny and grinds against her [enemy.cock], her pussy joining your mouth in the service. Her hands join yours at your furry toy’s heavy balls, kneading them between honey-glazed fingers. The thought of getting some pussy seems to revive the languid laquine as every cell in her body jumps at the opportunity!");

	output("\n\nFinally recovering, spurred on by a face full of suffocating muff, the slut-bun’s mewls turn to euphoric moans. Her limp hands lunge for her dick. Realizing she can’t reach it, she settles for your [pc.ass] instead, rubbing circles in your back and lancing your " + (pc.hasVagina() ? "[pc.pussy]":"[pc.asshole]") + " with her magma-spear of a tongue. Realizing her lollipop is dangling there too, she draws his cock back into her mouth with a satisfied murmur, her athletic tongue on his dick and your hole.");

	output("\n\nThe dusky girl in front of you aligns the jumper’s [enemy.cock] with her pussy, and thanks to all the preparation you helpfully provided, nearly takes it to the hilt with a piercing cry of bliss just by falling on it. The [enemy.cockType]-shaped bulge distending her trim tummy is proof of a happy unity. Honey squirts out on your chin and flows down to the jumper’s sloshing sack. While she humps experimentally, squealing around your probing fingers, you have a feeling nobody here is going to last much longer. Including yourself. There are a few ways this could end...");

	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Inside",slaveOrgyCumInside,undefined,"Inside","Get the jumper to bloat this girl!");
	addButton(1,"Outside",slaveOrgyCumOutside,undefined,"Outside","Let the jumper cum outside, all over everyone!");
	if(pc.hasVagina()) addButton(2,"SaeriPen",vaginaRouter,[saeriPenGangbang,50,0,0],"Saeri Pen Gangbang","Get the saeri boy to fuck you while the jumper licks for dear life!");
	else addDisabledButton(2,"SaeriPen","Saeri Pen Gangbang","This requires a vagina.");
}

//[Inside]
// Tooltip: Get the jumper to bloat this girl!
// PC will be ‘Cum Splattered’’
public function slaveOrgyCumInside():void
{
	clearOutput();
	showJumpyGangbang();
	output("The saeri fuckboy’s cock rubs between the laquine’s mouth and your " + (pc.hasVagina() ? "[pc.pussy]":"[pc.ass]") + ", growing harder and hotter with the passing of time. The rabbit’s cock stretches her soft pussy wide, threatening to dilate the feisty girl’s cervix. White honey drains from her gaped hole, draping the invading bunny-dick with replenishing sheens of fragrant love juice. As the moans around you go from harmonious to damn near anarchic, you pull your fingers from the redhead’s pussy and squeeze her sumptuous thighs.");
	output("\n\n<i>“W-wait, what are-”</i> she stammers, but you push her up. Her hazel eyes widen with shock when your fingers waffle to the top of her leg. In those split seconds before the ignition of your orgasm, you squeeze tight and push her down on the [enemy.cock] in her slit! Her eyes bulge and her pussy works desperately to provide adequate shelter for all 13 inches of bunny dick now wearing her like a condom, and already bloating her like one too!");
	output("\n\nHer head jerks back, and the last air in her lungs is spent on a delayed, hoarse scream. Sweat flies from red cheeks to jade scales as her head arches; the rabbit squeezes your [pc.ass] <i>hard</i>. Tongues hang limp from steamy mouths as orgasms chain together. You don’t have time to figure out if a womb was wrecked, because you’re cumming!");

	output("\n\nThe jumper’s dildo tongue ");
	if(pc.isHerm()) output("washes over your [pc.cocks] and the saeri boy’s yummy tip, eventually getting caught in your constricting [pc.pussy]. She’s quickly submerged in ultra-sticky saeri spunk and your [pc.girlCum] as you paint her abdomen [pc.cumColor].");
	else if(pc.hasVagina()) output("is caught in the trap of your constricting [pc.pussy], it and her face being flooded with [pc.girlCum].");
	else if(pc.hasCock()) output("washes over your [pc.cocks] and the saeri boy’s yummy tip, bringing you both to lavish climax.");

	output("\n\nAs you shake and rock in orgasm, the saeri shoots his seed all over your back and the bun’s mouth. The redhead lurches forward and gazes down in shock at you, her mouth shuddering insensate in the aftermath. But it’s not over for her yet, she squeals with the jumper as her belly heats and swells into early... <i>late</i> pregnancy. Cum billows out from the edges of her taxed tunnel, splattering the furry crotch from whence it came" + (enemy.hasCock(GLOBAL.TYPE_CANINE) ? ", the laquine’s knot failing to implant":"") + ".");
	output("\n\nYou’re quite aware of the pirate’s own pregnant-looking belly bulge, the gryvain’s cumsack empties a few seconds later in and out of her furry cocksock. Hard, ragged breaths in your crotch and the drip of warm cum all over your [pc.ass] bring you down from your climactic high; Two soft hands rub your butt before you flop exhausted to the side, sliding off the laquine with a loud huff.");

	pc.applyCumSoaked();
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",slaveOrgyCumInside2);
}

public function slaveOrgyCumInside2():void
{
	clearOutput();
	showJumpyGangbang();
	output("You come to a few minutes later in a puddle of cum, the bored jumper heaving and splayed next to you. Her [enemy.cockNounSimple] droops between her legs, but she looks incredibly happy. Glancing at you, she just rolls and laughs, making an angel in her cum puddle. <i>“Well you’re the only one left, what’d ya think? These mines are just full of hot fuckin’ sex aren’t they?”</i>");
	output("\n\nYou’re not entirely sure about that, but you’re glad to see your gear remained untouched. <i>“Awww wait noooo come onnn I can still keep going! Waitwaitwait!”</i> She calls as you leave her behind, but her body tells a different story: she can’t move her legs. <i>“Damnit...”</i> She curses, noticing <i>her</i> items are gone. <i>“I’m gonna get reamed for this!”</i>");
	output("\n\nYou point out that she already did. She merely giggles at your exit. <i>“Yeah whatever! I can still take more!”</i> Her echoes bounce down the corridor. <i>“Hope you join next time, cutie!”</i>");
	processTime(10);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Outside]
// Tooltip: Let the jumper cum outside, all over everyone!
// PC will be ‘Cum Soaked’
public function slaveOrgyCumOutside():void
{
	clearOutput();
	showJumpyGangbang();
	output("<i>That would be quite a sight</i> you muse... The laquine, so pent up and ready to cum just spraying her seed all over everyone like a baby-making fountain. Smiling impishly, you get ready to make it happen.");
	output("\n\nThe femmy butterfly grows more assertive, gyrating his hips into the bun’s mouth");
	if(pc.hasVagina())
	{
		output(" and sometimes between her [enemy.lipColor] lips");
		if(pc.balls == 0) output(" and ");
		else output(", ");
		output("your [pc.pussy]");
		if(pc.balls > 0) output(", and beneath your [pc.balls]");
	}
	output(". Watery pre drizzles from his twin cumslits, only making the repeat rolls of his waist into yours easier. As the sore lungs around you output increasingly desperate grunts and groans, you hook your fingers into the redhead’s pussy, giving her a quick tease before squeezing her chocolate thighs.");

	output("\n\n<i>“W-wait, what are you doing?”</i> She tries to reach for your arms, but you yank her up off the jumper’s [enemy.cockNounSimple]. The drag of the laquine’s dick through her inner walls makes her scream hoarsely, and a powerful orgasm soon rocks her entire being so hard that honey squirts from her muff. In those split seconds before you succumb to your peaking arousal, you lift your body up and bring the husky girl in for a deep kiss, her ass cheeks engulfing the jumper’s [enemy.cockNounSimple].");

	output("\n\nYour hands clasp with hers as every dick in this orgy detonates at once. The gryvain bellows a feral roar, thrusting her cocks to the base of her breeding knobs, flooding the rabbit’s ass and pussy with copious amounts of dragon spunk. Even though her knots aren’t in, they certainly cork her well enough. The saeri squeals behind you, both rippling slits on the head of his cock shooting out streams of sticky, silken cum that your bottom bitch is all too eager to drink up. Their climaxes quickly bring you to your own body-quaking orgasm.");

	output("\n\nWith all your weight on your crotch, you entrap the butterfly’s prick and the jumper’s tongue ");
	if(pc.hasVagina()) output("under and in your [pc.pussy], slathering dick and fuzzy nose with [pc.girlCum].");
	else if(pc.hasCock()) output("between your " + (pc.balls > 0 ? "[pc.balls]":"[pc.thighs]") + ", your [pc.cocks] depositing " + (pc.cockTotal() == 1 ? "its":"their") + " hot loads of [pc.cum] on sweat-drenched bellies above and below.");
	if(pc.isHerm()) output("between your " + (pc.balls > 0 ? "[pc.balls] and ":"") + "[pc.pussy], ropes of [pc.cumVisc] cum surging out on to sweat-drenched bellies above and below while your slimy muff glazes furry face and pretty prick below with [pc.girlCum].");

	output("\n\nBut the greatest orgasm of all is the pleasure-drunk jumper’s. Her [enemy.cock] puffs and grows even longer! Her sloshing apples churn out bukkake levels of cum. Even as her own belly bloats with gryvain spunk, thick strands of alabaster bunny batter shoot up to the ceiling and rain down in a hot mess, landing in everyone’s hair and more. The jumper’s cadenced thrusts, even while pinned and drowning in sexual effluvia, continue for half a minute before all involved pull out or collapse from the impact of a wanton orgy.");
	processTime(20);
	pc.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",slaveOrgyCumOutside2);
}

public function slaveOrgyCumOutside2():void
{
	clearOutput();
	showJumpyGangbang();
	output("It’s not long before you awaken, crumpled on a warm, bristling mattress, pleasantly moist... Wait. Opening your eyes, you’re lip-to-flaccid [enemy.cockNounSimple]. The smell of pheromones, musk, and mixed spooge assault you the second you come to. Sitting up, you glance around, first to where you left your belongings. Fortunately, they’re all still there. For better or worse, the jumper is still under you, quietly breathing. A yelp is forced up your throat when you feel a few thin whiskers caress your [pc.ass].");
	output("\n\n<i>“Hey babe,”</i> the lusty laquine calls, <i>“I don’t know about you but that was a great fuck! These mines are just awesome, aren’t they? Whoever released the slaves did me a favor.”</i>");

	output("\n\nChuckling softly, you dismount her and hurriedly grab your stuff. <i>“Aww wait!”</i> She calls. <i>“I can still go more! Awww!!”</i>");

	output("\n\nHer body tells a different story. She reaches lamely at you, though her legs are unresponsive. She looks around and realizes that her own stuff is missing. <i>“Damn it!”</i> She grouses. <i>“I’m gonna get reamed for this!”</i>");
	output("\n\nWhile you walk off, you helpfully point out that she already did. Before you’re out of earshot, she cries out, <i>“Hope you’ll be around next time! Or I’ll just find and fuck you instead!”</i>");
	output("\n\nThe laquine’s cum-drunk revelries slowly fade into the background.");
	processTime(20);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[SaeriPen]
// Tooltip: Get the saeri boy to fuck you while the jumper licks for dear life!
// PC requires a vagina
// PC becomes ‘Vaginally Filled’
public function saeriPenGangbang(x:int):void
{
	clearOutput();
	showJumpyGangbang();
	output("While you service the jumper’s cock and the pussy it’s widening, your own instinctive desire to be filled pokes holes in your psyche. Every dick around here has a home. Except one. A mouth isn’t quite the same as a pussy either. You look seductively over your shoulder to see the trappy saeri rubbing your [pc.ass] tenderly while jerking his dick underneath your [pc.pussy], electrifying your nerves with every [pc.clit]-teasing lunge. The jumper’s tongue teases his tip, your button, and your pussy all at once, desperately servicing you two with every sodden breath.");

	output("\n\nNuts to that! You’re burning up and turning into a sweat-goo. There’s a perfect dick right there, just waiting for a pussy.");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Hey silly,”</i> you call to the saeri, both hands spreading your [pc.ass] apart, <i>“Why don’t you use my pussy? It’ll feel sooooo... much... better! And I need a good filling!”</i>");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“Stop right there," + (silly ? " criminal scum!":"") + "”</i> you call with a stern look. You reach around and spread one of your ass cheeks to the side. <i>“Use this hole. You’ll feel much better, trust me.”</i>");
	// PC Kind
	else if(pc.isNice()) output("\n\nYou run a hand to [pc.oneVagina] and part your vulva with two fingers. Smiling at the saeri boy, you say, <i>“Here, you can put it right in here.”</i>");
	// PC Misch
	else if(pc.isMischievous()) output("\n\nSlapping your rump twice, you catch the saeri boy’s attention and part your flooding folds for him. <i>“Right here, cutie, stick it right in there! You deserve it!”</i>");
	// PC Hard
	else output("\n\nSnapping your fingers, you finger your twat, forcing it to ooze copious amounts of fragrant fem juice. <i>“Here, right there, forget the rabbit. Fuck me good, boy!”</i>");
	// Merge
	output("\n\n<i>“R-r-really?”</i> He asks sheepishly. You nod again with a sexy smile, licking your [pc.lips] for good measure. <i>“O-okay! Thank you very much!”</i> He aligns himself with an eager expression, much to the laquine’s chagrin.");
	output("\n\nReally, how did he end up here?" + (pc.libido() >= 50 ? " Hopefully he fucks as well as he means!":""));

	output("\n\nYou feel his fleshy tip rub against your [pc.pussy], up and down, up and down... soaking itself in your [pc.girlCumVisc] [pc.girlCumFlavor] juice. The roiling rabbit beneath, head-locked by your [pc.thighs], tries to reach out for his dick but can only get to his peachy cumsack. She slurps at the cute boy’s balls before he finds your opening, almost making him miss!");
	if(pc.libido() < 33) output(" You bite your lip, feeling him push in");
	else if(pc.libido() < 66) output(" You moan whorishly as he thrusts his rippling cock in");
	else output(" You scream in ecstasy when you’re speared on his perfectly sized cock");
	output(", his ample member being absorbed into your hot, hot twat and sucked hard by every clenching muscle within.");

	pc.cuntChange(x,50);

	output("\n\nThe flittery fairy squeals in delight, his nuts already caressing your [pc.ass], juggled by the jumper’s fat tongue. Lost in pleasure, he proves himself a capable breeder. Soon, he finds a powerful pace, thrusting in and out of your [pc.pussy] with wild abandon. His ministrations, his pistoning, would seem to be erratic and untrained, virginal even... <i>But they’re not</i>. He hits the same places inside with every hipstroke, and he swivels his waist while railing you for extra effect. He bends over you, pressing his flat chest to your back, close enough that you can hear his wings flexing in the throes of lust. <i>“" + pc.mf("Sir","Ma’am") + ", I’ll... I’ll cum soon!”</i>");
	output("\n\nNot surprising, you’ve all been going at it for... how long now?" + (pc.libido() >= 50 ? " Not long enough!":""));
	output("\n\nYou lean into the redhead’s crotch, licking at her clitty and the roiled rabbit’s thrusting cock. Her drenched belly jackhammers into you, her muscles at full power now, fucking that pussy like there’s no tomorrow. The saeri rubs your shoulders, massaging your back even as you arch under his erotic touches. Both of your hands lunge for the bouncing girl’s snatch, sliding in the gaps between her inner thigh and the mighty cock building permanent residence there, turning your hands into a makeshift onahole for the desperate laquine who licks and lurches.");

	output("\n\nVision blurring, your arousal boils over. The libidinous haze enveloping the five of you presses on your brain like a vice, a horny halo that makes you howl in happiness and howl again for lack of air. Tongues hang like unshouldered burdens as everyone cums together! [pc.GirlCum] squirts into the laquine’s nose and mouth - your lecherous body clamps down on its alien penetrator, its urethra swelling with cum. Through gemini cumslits, ropes of white hot saeri spunk splatter against your canal and especially your womb, pushing you over the edge again in your sensitive state. All you can do is arch your head back, mouth open wide, announcing your pleasure to your partners and the station." + (pc.exhibitionism() >= 66 ? " You almost hope there’s a hidden camera catching this and someone’s busting a nut or four all over the monitors!":""));
	output("\n\nThe redhead’s belly distends just in front of your [pc.face], filled to the brim with overflowing jizz that spills out from her taxed tunnel around the crotch from whence it came" + (enemy.hasCock(GLOBAL.TYPE_CANINE) ? " and the knot that failed to slip in":"") + ". Below, you can also feel against your [pc.chest] the jumper’s cum-clogged guts bulging with obscene amounts of dragon spooge as all in attendance moan in choral unison, breathing deep in wild satisfaction.");
	output("\n\nSlumping down, you let out a low breath before drifting off to a nap...");
	processTime(30);
	pc.orgasm();

	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.cumType = GLOBAL.FLUID_TYPE_HONEY;
	pp.createPerk("Fixed CumQ", 200, 0, 0, 0);

	pc.loadInCunt(pp,x);
	clearMenu();
	addButton(0,"Next",saeriPenGangbang2);
}

public function saeriPenGangbang2():void
{
	clearOutput();
	showJumpyGangbang();
	output("You awaken suddenly, glancing around hurriedly, the crappy lights making you squint in passing discomfort. You find you’re still sprawled out on top of the laquine jumper, her heaving chest carrying you up and down. You find yourself covered in cum. Even if you weren’t, the smell here clings to you like plastic. It’s so potent that you feel yourself getting turned on all over again. It might not be surprising that you could start <i>sweating</i> this scent!");
	pc.applyCumSoaked();
	output("\n\n<i>“Fuuuuck that was soooo hot!”</i> The jumper sputters to life, as if awakening from a wonderful dream. <i>“Oohh, this looks interesting...”</i> You yelp when her mouth runs up your moist slit, tiny furs tickling you. With a loud ‘Ha!’ and an accompanying giggle, you quickly dismount before she holds you down.");
	output("\n\nYou are definitely glad to find your belongings are where you left them.");
	output("\n\n<i>“Aw wait, wait, wait! I can still go another round, cutie!”</i> She looks at you with [enemy.eyeColor] puppy eyes, reaching out limply. The absolute state of her makes you laugh. She looks around, seeing that her suit and other items are missing.");
	output("\n\n<i>“Aw damn it!”</i> she curses, <i>“I’m gonna get reamed for this!”</i>");
	output("\n\nYou point out that she already did, which makes her giggle as you scurry off. All you can wonder is: where did that saeri go? Ah well...");
	processTime(10);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//[Take Over]
// Tooltip: You’re going to be conducting this. Get on the Jumper and dole out the roles.
// PC requires a penis or hardlight strapon.
public function takeOverTheGangbang():void
{
	clearOutput();
	showJumpyGangbang();
	output("Running a hand over your crotch, " + (pc.hasCock() ? "you jerk your [pc.cocks] to readiness,":"you flip on your holographic endowment,") + " thinking about a number of ways you can take over. The action continues in your brief inventiveness. Where could that saeri go? What about that dark-skinned redhead? You could get that rabbit all to yourself, or maybe fuck that thick-thighed hottie? Maybe let the saeri go at your fuckbunny-to-be with you?");
	output("\n\n" + (pc.hasCock() ? "[pc.CocksLight] throbbing,":"Your groin tingling and lurching unbidden,") + " you inhale the mouth watering stench of unrestrained sex. The wavy, crotch kindling air around you seems to be mating as fiercely as the jumper services the slaves, now one to lust herself. Chest thumping as musk and pheromones settle in your sweat-caked pores, a sultry grin crests your [pc.face], knowing exactly what you’ll do.");
	output("\n\nDropping behind the jumper, your [pc.arms] snake under hers. You grope her hot, wet chest, pinching those big, needy nipples for all their worth. She shoves her sweaty hip into your lap, grinding her tight, brown-furred butt into " + (pc.hasCock() ? "your [pc.cocks]":"your techno-strapon") + ". Sandwiched between her wide ass, you let a shaky hand fall to her [enemy.cock], fingers traveling down her foot long prong, around her fuzzy balls and past the puffy lips of her sopping mare-cunt.");
	output("\n\nWith both hands busy, all she can do is mewl around the saeri cock she fellates so fervently. You press your fingers against every side of her moist tunnel while she grinds against your lap.");
	processTime(5);
	pc.lust(15);
	clearMenu();

	addButton(0,"Bun’n’Fly",cockSelect,[bunNFlyGangbangu,enemy.vaginalCapacity(0),true,0],"Bun’n’Fly","Fuck the jumper reverse cowgirl and let the saeri go at her pussy while the gryvain & redhead tend to each other.");
	addButton(1,"Redhead",cockSelect,[redheadfuckiroodidoody,enemy.vaginalCapacity(0),true,0],"Redhead","Get the jumper on her back and sit the sexy redhead on her face, then fuck her.");
}

//[Bun’n’Fly]
// Tooltip: Fuck the jumper reverse cowgirl and let the saeri go at her pussy while the gryvain & redhead tend to each other.
public function bunNFlyGangbangu(x:int):void
{
	clearOutput();
	showJumpyGangbang();
	var y:int = -1;
	if(pc.cockTotal() > 1)
	{
		for(var i:int = 0; i < pc.cockTotal(); i++)
		{
			//Dick that fits and isn't the main one? Lez do it.
			if(y == -1 && pc.cockVolume(y) <= enemy.vaginalCapacity(0) && i != x) y = i;
		}
	}
	output("Yeah... that’ll work just fine. Making sure it sounds feasible in your head, you grin and look to the slaves before yanking the slut-bun up a few inches.");
	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Sorry girls, but I’ve got plans for this honey bunny!”</i> You announce, aligning your " + (x >= 0 ? "[pc.cocks]":"holocock") + " with the jumper’s leaky hole" + (x >= 0 && pc.cockTotal() > 1 ? "s":"") + ".");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“I’m afraid this rabbit belongs to me right now.”</i> You declare, positioning her drizzling hole" + (x >= 0 && pc.cockTotal() > 1 ? "s":"") + " above your " + (x >= 0 ? "[pc.cocks]":"holocock") + ".");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“Don’t mind me,”</i> you murmur, <i>“I’m going to take her for a ride.”</i> Moving the jumper’s cock out of the way, you line your " + (x >= 0 ? "[pc.cocks]":"holocock") + " up with her leaky hole" + (x >= 0 && pc.cockTotal() > 1 ? "s":"") + ".");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“Alright, make some room! This jackrabbit’s about to go ‘jumping’!”</i> You grin, wasting no time in aligning your " + (x >= 0 ? "[pc.cocks]":"holocock") + " with her wet, waiting hole" + (x >= 0 && pc.cockTotal() > 1 ? "s":"") + ".");
	// PC Hard
	else output("\n\n<i>“This slut’s mine now.”</i> You stare coldly at the grimacing gryvain as you press your " + (x >= 0 ? "[pc.cocks]":"holocock") + " to her hole" + (x >= 0 && pc.cockTotal() > 1 ? "s":"") + ".");
	// Merge
	output("\n\nYou waste no time skewering your laquine fuckpuppet, thrusting your " + (x >= 0 ? "[pc.cock " + x + "]":"hardlight dong") + " all the way into her slick tailhole, making a short but exquisitely pleasurable trip through several inches of rabbit assflesh. A delightful squeal is forced out of your brown-furred bottom’s mouth - you push every inch of your member in until your groin presses into sweaty, damp laquine ass" + (y >= 0 ? ", your extra [pc.cockNoun " + y + "] prying her legs apart":"") + ".");
	pc.cockChange();
	output("\n\nClasping your hands around her waist, rubbing her erect [enemy.cockNounSimple] with your knuckles, you fall back with the warm bunny pirate on top of you. <i>“Wha-!”</i> Her pelvis crashes into yours with enough force to make you wince and nearly cum. <i>“Oh damn!”</i> The rabbit screams in surprise, tugging on the gryvain and saeri as she plunges. <i>“That’s exactly what I needed! Come on, harder harder!”</i> She praises, humping up and down on your " + (x >= 0 ? "[pc.cocks]":"glowing rod") + ".");

	output("\n\nYou quickly grab the slut’s arms" + (y >= 0 ? ", quickly slipping your extra [pc.cockNounSimple " + y + "] into her swampy nethers,":"") + " and pull her down over your [pc.chest]. She gasps and flounders for the gryvain’s dual dicks and her saeri lollipop, but she resigns herself to a ride on ");
	if(y >= 0) output("your double-penetrating lengths");
	else if(x >= 0) output("your length");
	else output("your glow-cock");
	output(". <i>“Ohh!”</i> She moans. <i>“This is soooo fucking hot!”</i> she reaches over and jerks her painfully erect [enemy.cockNounSimple], only able to get her fingertips around the crown. <i>“Don’t you dare go slow, or I’ll pound you instead, cutie!”</i>");

	output("\n\nKeeping her flaccid warning in a mental ditch where it belongs, you tell her you’d like to see her try with your ");
	if(x >= 0) 
	{
		if(y >= 0) output("[pc.cockHeads]");
		else output("[pc.cockHead " + x + "]");
	}
	else output("bright dong glowing and");
	output(" bulging against her tummy. All she can respond with is a pleasurable squeal that only excites you and the others to the next level. The gryvain and the dusky redhead, now without their slutty sex doll, fall next to you. The redhead crawls provocatively over the befuddled dragon-babe, frotting the jade lady’s knotty cocks with her glistening honey hole. You look to the effeminate saeri boy, jerking himself in silence, looking a little lonely.");
	output("\n\n<i>“Hey,”</i> you peer around your insensate slut-bun, <i>“Go ahead and use this...”</i> You murmur, [pc.hands] moving the jumper’s balls aside and revealing her " + (y < 0 ? "free":"stuffed") + " horse twat to the trappy butterfly. <i>“Go ahead and get right in there!”</i>");
	output("\n\nThe jumper perks up at that. <i>“Oh yes!”</i> She screams more than a few times, powerful legs bouncing against your [pc.thighs]. <i>“Fuckmefuckme!”</i> She cranes her neck to the shy saeri, moving both trembling paws to her pussy as well. <i>“That’s the best idea I’ve heard all day!”</i> She exclaims, spreading her snatch wide, making a sexy face and moan to punctuate her desire for good dick.");
	output("\n\n<i>“Is that... is that okay?”</i> he asks, leaning forward all the same. You and your bun nod feverishly as he lines up his glossy cock with " + (y < 0 ? "her pussy":"the pussy you pound as valuable time flies by") + ".");

	// PC one cock/hardlight
	if(y < 0)
	{
		output("\n\nYou grip the jumper’s hips and slow her just long enough for the petite boy to move her heavy sack out of the way. He rubs his bright pink tip into her slit, getting himself ready on her sexual spillage. Out of what can only be described as respectful affection, he jerks the jumper’s precipitous length while pushing himself in slowly. She reaches a hand out that he gladly takes, and their fingers crisscross as his eyes shut in utter bliss, his alien rod plumbing close to her womb.");
	}
	// PC multi cock
	else
	{
		output("\n\nYou grip the laquine’s waist and hilt her on your rods just long enough for the petite butterfly to move her thick testes aside. With your ");
		if(x < 0) output("artificial");
		else output("[pc.cockType " + x + "]");
		output(" shaft still filling her rippling canal, he pinches her clit. Unsure if it will work, he still makes the effort to slide in past the four hands spreading those swollen, aching lips for him. You catch your breath, soon shuddering and whimpering, feeling his segmented cock rubbing against your own, sliding up her pussy with remarkable ease. Her gut distends further, those spasming walls having to make room for two mismatched dicks now. Neither you nor your fuzzy bun would have it any other way.");
	}
	// Merge
	output("\n\n<i>“Fuck yeah, more more more!”</i> The horny bunny cries, jerking her hips - and your sensitive dong");
	if(y >= 0) output("s");
	output(" - to enswathe the cute boy’s turgid rod in her creaming twat. ");
	//pcOneCock/Hardlight:
	if(y < 0) output("The equine pussy spreading around the saeri’s cock eases his entrance and soon you feel his cock massaging yours in her pre-painted butt. When you pump your hips through her, the butterfly withdraws, and together you maintain a heavenly rhythm.");
	//pcMultiCock:
	else output("When you pump your hips through her, the butterfly withdraws, and you maintain a heavenly rhythm. His twilight cock and your [pc.cockNounSimple " + x + "] mutually massage as they stretch her tunnel wide, even grinding against your first dick spurting [pc.cumColor] precum all through her vice-like ass.");

	output("\n\nThe rabbit falls back, slipping an arm around the back of your head and drawing you into a cum-scented kiss, one jerking hand still working her hefty boner. As your tongues wrestle in a sloppy, disorganized manner, the gryvain hefts the redhead up above the both of you, their fragrant, oozing pussies raining love and honey down on you. The laquine licks what she can off your face with the salty sweat as the human girl is speared on two matching wyrm cocks, musk and pheromones both billowing out from her slick holes. They hold each other tightly, the dusky girl’s legs wrapped around the jade dragon’s waist and the emerald gryvain’s scaly mits clutching a curvaceous derriere.");

	output("\n\n<i>“Awesooome!”</i> The rabbit moans, still ramming her muscled butt into your crotch as the saeri leans down over her. The clashing of crotches above and the moans in front of you soon drown you in the rivers of lust. Every contraction in her holes is something to be relished: ");
	if(y < 0) output("the tensing way it squeezes your " + (x >= 0 ? "[pc.cock " + x + "]":"techno dong"));
	else output("the tensing way they squeeze and slather your [pc.cocks]");
	output(" is more than just her wanton body’s attempt to please its partners: every pulse in her passage makes you feel as though your cock grows with every impact.");
	output("\n\nAll in participation, yourself included, become nothing more than animals fucking away in mindless lust. The raw sexual emissions in the air, infecting every functioning brain cell with virulent hormones, can no longer be ignored. You and the gryvain growl loudly - she even bites her redheaded partner. The femmy saeri’s lungs only output hoarse, shrill screams that work well in tandem with the jumper’s, whose own sounds have become indecipherable howls. Heralding her impending orgasm, her sphincter and pussylips clamp down as her [enemy.cockNounSimple] is teased from base to tip by an elegant butterfly. When her clit is pinched, she inhales - that portentous limbo of silence foretold by deep, shuddering gasps tells your hyper aroused body just what it needs to do.");

	// PC one cock/hardlight
	if(y < 0)
	{
		output("\n\nNerves afire, you lock both hands around the jumper’s waist to hold her steady, hilting inside her ass and bellowing in orgasm. Wet, sticky sounds tell of wasted, virile bunny cum flying up to the ceiling. What doesn’t hit falls with the cascade onto the members of this sweaty orgy, on your face, her face... It just goes on and on, much like her shivering groans and her violent orgasm. " + (x >= 0 ? "Your [pc.cockHead " + x + "] swells with [pc.cum], spurting hard enough to dim your vision with every ribbon of cum painting the laquine’s colon [pc.cumColor].":"Your legs shudder and your breaths are pained. Your hardlight strapon, transmitting only the strongest sensations of pleasure, brings you to explosive orgasm as the laquine’s ass attempts in vain to draw cum from your holocock.") + (pc.hasVagina() ? " Your [pc.pussy] squirts stream after stream of [pc.girlCum], landing only on the ground where it sizzles out, filling the air with the scintillating scent of [pc.girlCum].":""));
	}
	// PC multicock
	else
	{
		output("\n\nThe exotic pleasure of sharing a pussy with another dick, of two stimulating tips rubbing against one another, has been an experience unlike any other. When the twilight slave cums, you cum as well, flooding the rabbit’s " + (x >= 0 ? "ass and ":"") + "pussy with [pc.cum] that soon drizzles out from her gaping hole, mixed with even stickier saeri spooge. You watch her eyes roll back, her cute little face a complete mess right next to your own. Every eruption, the tremors magnified by her violent trembling and the saeri’s stiffening, brings you closer to unconsciousness. As you ride the wave of your own orgasm, the jumper’s [enemy.cock] spews obscenely thick ropes of cum straight up to the ceiling. What doesn’t hit the jagged rocks overhead drips down with what does, landing all around." + (pc.hasVagina() ? " Your [pc.pussy] squirts stream after stream of [pc.girlCum], landing only on the ground where it sizzles out, filling the air with the scintillating scent of [pc.girlCumFlavor].":""));
	}
	output("\n\nGlobs of honey spill down from above like a heavenly rain. You catch some of it, reveling in the sinfully sweet taste of modded girl-cum. The gryvain plugs both the redhead’s holes with a healthy dose of draconic cum, her huge tits clapping wetly against their bodies with every heave of her burning chest. The chocolatey terran girl goes limp and the gryvain falls to her knees next to you. The pirate slut’s voice is nothing but a series of mirthful hyperventilations, and the saeri only makes her yelp as he pulls free of her well used bitch hole.");
	output("\n\nYour vision soon clears up, and you feel stronger than ever. Breathing deeply, you slide the jumper off of you");
	if(pc.hasKnot(x) || pc.hasKnot(y))
	{
		output(", careful to keep your ");
		if(pc.hasKnot(x) && pc.hasKnot(y)) output("knots");
		else if(pc.hasKnot(x)) output("[pc.knot " + x + "]");
		else output("[pc.knot " + y + "]");
		output(" from slipping in and locking you here for the next half hour")
	}
	output(". Pulling free from her, you watch your cum dribble out from the jumper’s brown backside as the slaves collect themselves. The gryvain and redhead scamper off as soon as they can stand, stealing her equipment. The saeri gives you a meek wave and flees in another direction. Taking another breath, you sit up and hurriedly gather your things, paying one last glance to the naked pirate.");
	output("\n\nWhatever her punishment is, going back to her friends naked like that, is a mystery you kind of wish you could see...");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Redhead]
// Tooltip: Get the jumper on her back and sit the sexy redhead on her face, then fuck her.
public function redheadfuckiroodidoody(x:int):void
{
	clearOutput();
	showJumpyGangbang();
	var y:int = -1;
	var z:int = -1;
	//Find an unused dick for DP!
	for(var i:int = 0; i < pc.cockTotal(); i++)
	{
		//Dick that fits and isn't the main one? Lez do it.
		if(y == -1 && pc.cockVolume(y) <= enemy.vaginalCapacity(0) && i != x) y = i;
	}
	if((x < 0 && pc.cockTotal() > 1) || pc.cockTotal() > 2)
	{
		for(i = 0; i < pc.cockTotal(); i++)
		{
			//Dick that fits and isn't the main one? Lez do it.
			if(z == -1 && pc.cockVolume(z) <= enemy.vaginalCapacity(0) && i != y && i != x) z = i;
		}
	}
	output("These slutty rabbits may be cute, and they may just want a good fuck, but you can’t get your [pc.eyes] off that sexy slave: a terran girl with short, sweaty red hair and a gifted, curvy body that looks criminally plush. A brainwashing scent wafts up from the minx’s pussy as she looms over yours and the jumper’s head, spreading her bare, supple, glistening pussy before your very eyes with a flustered expression. <i>“You know what to do”</i> she whispers. The laquine instinctively thrusts her face in that direction, dragging the girly butterfly with her jaw.");
	output("\n\nMewling in lustful agony, the jumper swirls her tongue around the saeri’s bright pink tip, struggling with wanting to suck him off or getting her mouth on that dewy mound. There’s a better idea...");
	output("\n\nYou hop up to your [pc.feetOrFoot], still squatting. Reaching your right [pc.hand] out to the redhead, you take her by the wrist and drag her forward as you bring the jumper down flat on her back. <i>“Woah! What the he-”</i> the husky-voiced girl sputters. The saeri and gryvain lurch as they’re both pulled by their cocks. Before the roiling rabbit can figure out what’s going on, you twirl the terran beauty and sit her directly on the jumper’s face, bending her over. It’s a powerfully erotic sight to see her rich, creamy, wobbly cheeks spread, her moist, swollen femininity exposed to you, begging for a tongue to swim through its soft undercurrents...");
	output("\n\nAnd the jumper hears its pleas, wrapping both paws around those enviable thighs and lunging forward, straining every muscle in her neck as she dives into the girl’s honeypot face-first. Her clit being teased, the redhead squeals loudly and looks about to cum already! Her hands are already trembling on the laquine’s belly; the bunny bitch’s [enemy.cock] wanting to caress her chin just above the [enemy.cockHead].");
	output("\n\n<i>“Mmm,”</i> the slut-bun moans, <i>“This ish good...”</i>");
	output("\n\nHer broad tongue works its way all around the terran’s slick pussylips, drinking up the salty sweat and honey-flavored juice with rabid need. In her [enemy.eyeColor] eyes, you can see nothing but gluttonous hunger for cunt and clit as she draws the girl’s crotch down so far that she’s submerged in mouthwatering twat. <i>“Sho gooooooddddd!”</i> She squeals. <i>“Sho sweet and tashty!”</i>");
	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Hope you’re ready for more than just pussy!”</i> You smile wide as you bring your " + (x >= 0 ? "[pc.cocks]":"hardlight strapon") + " closer to her mouth and the terran’s twitching thighs.");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“Make some room, and get ready for a taste of me.”</i> You smirk, slapping the laquine with the flank of your " + (x >= 0 ? "[pc.cock " + x + "]":"hardlight strapon") + ".");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“You’re going to be working a lot harder than that. Now make some room...”</i> You say as you bring your " + (x >= 0 ? "[pc.cocks]":"hardlight strapon") + " closer to that pocket of sluttery.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“Hope you’ve got a similar taste for dick.”</i> You laugh, rubbing your " + (x >= 0 ? "[pc.cockHeads]":"hardlight strapon’s tip") + " into the rabbit’s face and furrowing nose.");
	// PC Hard
	else output("\n\n<i>“Move back, and get ready for more than a pussy.”</i> You order the jumper, moving your " + (x >= 0 ? "[pc.cocks]":"hardlight strapon") + " to to where lips and pussylips are connected by spit and girl juice.");

	// Merge
	output("\n\nYou gingerly push your " + (x >= 0 ? "[pc.cockNounSimple " + x + "]":"techno dong") + " between the jumper’s [enemy.lipColor] mouth and the redhead’s glossy honey hole. It’s hard not to inhale these strangling scents with every heady breath you take, shit, it smells like a ripe zil orgy! A growl-like exhalation later, you hear the redhead squeal, your cock being slathered in a fresh helping of modded cum. Saccharine, amber honey flows over your " + (x >= 0 ? "[pc.cockType " + x + "]":"faux") + " shaft like syrupy glaze, trickling down to the laquine’s wide open mouth.");
	output("\n\nHer tongue washes your fragrant " + (x < 0 ? "techno ":"") + "dong" + (x >= 0 && y >= 0 ? "s":"") + " like a sponge, absorbing every drop of her treat while lathering you up for the terran’s ready pussy" + (y >= 0 ? " and maybe for her mouth as well":"") + ". <i>“You gonna use " + (y >= 0 ? "that":"those") + " or what, cutie?”</i> The rabbit grins at you, her muzzle mostly obscured by sweaty skin. <i>“Don’t leave me out, c’monnn! Let me taste some more!”</i>");
	if(y < 0) output("\n\nToo bad she’s not your target, no matter how much she begs and smiles.");
	else if(z >= 0) output("\n\nYeah, you can spare a dick for her.");
	output(" While you rub your ");
	output("[pc.cockHeads] against the redhead’s slit, lubing your " + (x >= 0 ? "[pc.cocks]":"hardlight strapon") + " up for penetration, the gryvain shuffles a little angrily to the laquine’s crotch, yanking her legs up and making her ‘eek!’ as her [enemy.cock] is pushed aside and her heavy, fuzzy balls are lifted up. The dragon girl wastes no time ramming her tapered, knotty wyrm cocks into the jumper’s ass and equine pussy both, meeting no resistance thanks to the natural lube of musky rabbit crotch.");
	output("\n\nYou grin seeing the not-so-bored rabbit’s tongue hanging out of her mouth as she mimes something silly" + (z >= 0 ? ". Well, she wanted a taste too! You quietly slip one right in as you get ready":"") + ".");

	output("\n\n<i>“H-hey... Hurry up!”</i> The scowling girl looks over her shoulder as she wiggles her butt at you, both round ass cheeks jiggling. A light pressure in your crotch makes you wince, the rosy shade on her face distracts you as she takes you to task, pushing her globes back and lancing herself on your " + (x >= 0 ? "[pc.cockNounSimple " + x + "]":"holo cock") + " with a forceful thrust. Her blissful wails echo through the mines; you clench your [pc.hands] around her waist and focus on her, panting madly. Her wonderfully <i>hot</i> pussy hugs your " + (x >= 0 ? "[pc.cock " + x + "]":"glowing dong") + ", thirsty for all the sticky cum you " + (x >= 0 ? "can":"sadly can’t") + " give. Your first few pumps in and out of her silky folds make you feel as though you sit upon a cloud of euphoria" + (pc.balls > 0 ? ", your [pc.sack] wetly slapping her thighs with every deep, uterus-touching thrust":"") + ".");

	// PC Multicock
	if(y >= 0)
	{
		output("\n\nBefore fucking her proper, you take your extra [pc.cockNounSimple " + y + "] and wriggle yourself - and her - into proper position. There is no protest as you plant the [pc.cockHead " + y + "] to her sphincter, her ass cheeks engulfing your pre-spurting rod. Her moans are so loud, as if conjured to draw others to this debauchery. Her bangs spray beads of vaporous sweat all around as her ass is spread by your [pc.cockColor " + y + "] pillar of meat.");
	}
	// Merge
	// PC has balls
	if(pc.balls > 0)
	{
		output("\n\nYour [pc.balls] hang" + (pc.balls == 1 ? "s":"") + " over the jumper’s face, and as soon as she recovers from her double dicking, she seeks out the savory ballflesh hovering above, desperate to do anything as she and her [enemy.cock] go unattended. You soon feel her thick, warm tongue drawing lewd shapes in the underside of your creasing cum sack, even reaching a furry paw over to knead your warm nads as she feverishly fondles the girl atop her.");
	}
	// Merge
	output("\n\nThe redhead’s pussy fills out like a glove every time you touch your cockslit to her womb. At your deepest, you grind your hips left and right, using her pussy to give your rod a series of erotically straining jerks. As her muscles spasm and she comes again, squirting honey on your [pc.thighs]" + (pc.balls > 0 ? " and down your [pc.sack":"") + ", her knees give out and she slumps belly first on a fuzzy jaw. The laquine’s hips buck upward even with her legs hiked over the jade gryvain’s shoulders. Interestingly, the saeri finally sets himself down in front of the redhead, presenting his moist cock to her.");
	output("\n\n<i>“P-please, if it’s no trouble...”</i> He asks gently, one shy hand over his blushing cobalt face and the other jerking his alien endowment. The terran girl, whether out of sheer lust or elsewise, spreads her lips across his tip and inhales his twilight phallus, arousing sounds carrying to every ear around.");
	output("\n\nThe bunny moves both mits to where the redhead’s crotch meets yours, aimlessly molesting her nethers and your " + (x >= 0 ? "[pc.cocks]":"hardlight strapon") + ", cooing everytime she makes you flinch. The saeri boy’s wails amplify the gryvain’s feral bellowing as they get closer to messy orgasm; the laquine’s [enemy.cock] humps between his petite ass with shockwave generating impacts.");
	output("\n\nThe dragon woman’s savage thrusting fuels the fire in your own loins, driving you to rail the sugary, spitroasted slave in your lap with unmatched speed. A few playful palm taps against your sensitive cock make your teeth clench and hands shake. A series of shudders and whines morph into hyperventilating pants that grow louder with each that worms its way up your throat. <i>You’ve got to keep thrusting!</i> There’s a beautiful girl there howling in the pleasure that you’re giving her, you can’t stop for anything!");

	output("\n\nA hand at your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasCock()) output("[pc.cocks]");
	else output("crotch");
	output(" forces your eyes shut. Two squirming feet caress your [pc.legOrLegs], and a voice calls out for you to cum! Your saliva-coated tongue falls from your overheating mouth as you slam your hips into the redhead’s" + (pc.balls > 0 ? ", [pc.balls] planted firmly on the laquine’s muzzle":"") + ".");

	// PC Hardlight
	if(x < 0)
	{
		output("\n\nYour high tech strapon, surging into the redhead’s pussy, is smothered by tight, constricting walls that make your whole body feel as if it’s being pleasured by that syrupy quim. Orgasm bounces up and down your spine; your head arches back, and sweat flies off you like you’re a fully soaked towel.");
	}
	// PC one cock
	else if(y < 0 && x >= 0) 
	{
		output("\n\n[pc.Cum] fills your stretching cumtube, surging into the redhead’s pussy like a divine shot, smashing into her womb with the impact of an erupting volcano. The seconds-old loads are pushed out by the new" + (pc.hasKnot(x) ? ", spilling out around your [pc.knot " + x + "]":"") + ". Your orgasm is made inexpressibly pleasurable, her constricting canal easing out every drop of jism with hard grips" + (pc.hasVagina() ? " that force you to drench the jumper’s face with spurts of [pc.girlCum]":"") + ".");
	}
	// PC multicock
	else 
	{
		output("\n\nYour [pc.cocks] swell with cum, each urethra bulging with [pc.cum] that soon surges into the redhead’s pussy and ass like a divine shot. Her womb and colon are smashed with the impact of an erupting volcano, the seconds-old loads being pushed out by the new");
		if(pc.hasKnot(x) || pc.hasKnot(y))
		{
			output(", spilling out around your ");
			if(pc.hasKnot(x) && pc.hasKnot(y)) output("knots");
			else if(pc.hasKnot(x)) output("[pc.knot " + x + "]");
			else output("[pc.knot" + y + "]");
		}
		output(". She jerks violently in your grasp, dragging your still-cumming cocks in several directions, making your orgasm indescribably powerful. You last longer than most, too, as thick ribbons of cum are eased out by her shameless body’s spasms." + (pc.hasVagina() ? " The vicious struggle to stay upright spreads the boiling pleasure to your [pc.pussy]. It soon drenches the laquine slut’s face with spurts of [pc.girlCum].":""));
	}
	// Merge
	output("\n\nWhile your orgasm blurs the lurid details around you, the jumper and slaves also cum. A downpour of pearly jumper cum rains from above as her [enemy.cock] spews; the gryvain roars as she bloats the laquine’s guts. The saeri cums too, his ultra sticky goo connecting his spattered abdomen with the redhead’s messy chin.");
	output("\n\nAt the denouement of the orgy, as breathing eases and cum stops dripping from the mire above, you and the slaves all disentangle from the nude laquine whose body leaks as much sexual fluid as sweat. The gryvain appropriates the pirate slut’s gear before hurrying off. The saeri meekly waves, though the redhead sticks around longer, looking at you with a happy blush. When she too runs off, you note an odd snake-like figure hissing and chasing after her from another corner.");
	output("\n\nHurriedly, you gather your things and leave the unconscious jumper behind before that creature turns its sights on you. At least you had some fun!");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Watch]
// Tooltip: On a pirate station, you’re pretty sure voyeurism is <i>encouraged!</i>
// Two scenes, played sequentially
public function watchSomePirateGanguBanguSlanguWangu():void
{
	clearOutput();
	showJumpyGangbang();
	output("Thinking it’s best to sit this " + (flags["JUMPER_GANGBANG_WATCHES"] != undefined ? "one ":"") + "out, you find a closer, comfortable nook to peek out from behind" + (pc.isCrotchExposed() ? " and move your [pc.crotchCover] out of the way":"") + ". You can’t be too sure of the slaves intentions, they might try to take out their sexual frustrations on <i>you</i> if they’ve gone long enough without getting laid! Wearing an impish grin, you peer over a rock at eye length and watch as things get steamier.");

	// PC not taur
	if(!pc.isTaur())
	{
		if(pc.hasCock()) output("\n\nYour adventurous [pc.hands] grasp for [pc.eachCock].");
		else if(pc.hasVagina()) output("\n\nYour adventurous [pc.hands] cup [pc.eachVagina].");
		else output("Your adventurous [pc.hands] dart for your [pc.asshole] and caress your [pc.chest].");
	}
	// PC taur
	else output("\n\nDue to your expansive frame, you can’t quite reach your own genitals, but as your hindquarters buck and your body heats up, you don’t think it’ll be a problem.");
	// Merge
	IncrementFlag("JUMPER_GANGBANG_WATCHES")

	// Scene 1
	if(flags["JUMPER_GANGBANG_WATCHES"] % 2 != 0)
	{
		output("\n\nThis close to the action, you make out the slave’s appearances better. The first slave, the one pounding the jumper’s warm pussy with strong, furred hands on her bubbly butt, is a tall kaithrit hermaphrodite. Long black hair sharpened by moisture and two tails flick aggressively behind her curvy, olive body. In the gap between her thighs you can see a heavy, swinging sack full of churning cum. Flanking the laquine are two others, one a blonde ausar girl who’s half the size of the others, and the third is a grimy looking gryvain positioned opposite the spitroasted rabbit, whose dark blue wyrm cock is straining in the desperate laquine’s mouth. The poor puppy seems a bit left out in this arrangement, but then you see her forcing a languid paw into her slavering slit.");
		output("\n\n<i>Girls only" + (silly ? " in this adult swim":"") + ",</i> you muse, watching with bated breath as big, sweaty boobs bounce in every possible direction. Perspirant flies like rain in the tit tornado, even from the ausar’s D-chest - the smallest of the bunch! The kaithrit woman’s keen figure and rapid movements capture your attention. She fucks that rabbit’s cunt with <i>purpose</i>! Even from here, you can see the muscles flexing in her deliciously thick thighs, sweat rolling over the outlines of bone and sinew as she thumps the pirate slut mercilessly. Her balance and technique leave even you a bit jealous, though you’re not sure if you’d like to do as she does, or <i>be done</i> by her...");
		output("\n\nThe gryvain herm, both scaly hands on the jumper’s soaking ears, claps weighty nuts with captivated chin as she unloads a thick load of dragon spunk into and onto the brown-furred bun’s mouth. She flops over the furry head of her leporine cocksleeve, pounding her jaw, uttering naught but a few high pitched moans before biting her lip. The sheer intensity of the gryvain’s climax; the volume and virility spewing out of those backed up balls makes you shudder, because she still looks hard enough to pierce steel! Large pools of cum easily form beneath the two of them. Her knot alone looks like it could permanently gape any hole spread by it!");
		output("\n\n<i>“This is crap..!”</i> The ausar grouses, groaning from the accumulated sweat and arousal. <i>“TURN HER OVER ALREADY, I’m fucking DYING here!”</i> She barks.");
		output("\n\n<i>“H-hold on!”</i> The kaithrit grunts. <i>“We’ve all been waiting long enough, just hold on a little longer, damn it!”</i>");
		output("\n\nBabbling with a mouthful of cum, the laquine giggles deliriously, <i>“Heeyyy, theresh e’nuff to go around, play naish now!”</i>");
		output("\n\nFor her efforts, she gets a light slap on the face from the gryvain and a mouth stuffed with messy dragon dick to the ausar’s growing annoyance. Your eyes are locked on the kaithrit, whose whole body flexes with sexual energy, fucking and fucking away so hard and yet she seems so far from orgasm!" + (pc.libido() >= 50 ? " You already feel like it’d be a good idea to join in just to get that kitty cock in you. You could show her a better time than that stupid, sexy rabbit!":""));
		output("\n\nShe doesn’t have any horns next to her triangular ears, so she’s definitely not been Treated, but damn, she looks like she could fuck a New Texas bull into the ground! With increasingly lewd and incoherent screams of pleasure echoing down the passageways, you see the big kitty’s movements go from smooth to erratic in the passing minute. When her pink, nubby dick swells and hilts in the laquine’s horse-hole, you also see the bun’s [enemy.cock] uncork and spray the hot ground beneath her with a hotter load.");

		// PC not taur
		if(!pc.isTaur())
		{
			output("\n\nThe smells and grumblings carry over to where you are, making you ");
			if(pc.hasCock()) output("jerk your rock hard [pc.cocksLight]");
			else output("finger your " + (pc.hasVagina() ? "[pc.pussy]":"finger your [pc.asshole]"));
			output(" faster. Your [pc.eyes] begin to squint as your arousal builds" + (pc.tailCount > 0 ? ", and your [pc.tails] wag to a blur":"") + ". You feel a sharp grip in ");
			if(pc.balls > 0) output("your [pc.balls]");
			else if(pc.hasVagina()) output("your [pc.womb]");
			else output("your chest");
			output(" when the girls move their fuzzy prey, on all fours, into a new position. The pirate surrenders without a second thought to their whims as another hard breath flows over your parted lips.");
		}
		// PC taur
		else
		{
			output("\n\nThe ripe stench of bitches is carried on a pungent breeze to you, making ");
			if(pc.isHerm()) output("your [pc.crotch] throb and tingle painfully, direly in need of penetration, of the touch of a partner.");
			else if(pc.hasCock()) output("[pc.eachCock] throb painfully, in need of more physical stimulation.");
			else if(pc.hasVagina()) output("[pc.eachVagina] thrums and tingles, crying out for direct contact.");
			else output("you squirm and slump, furiously groping yourself.");
			output(" You focus your thoughts inward... You may not be getting any right now, but if you concentrate you may just get off...");
		}
		// Merge
		output("\n\nPulling her foot long cat dick from the jumper’s gaping pussy, the muscular kaithrit woman yanks a furry leg up and falls on to her side, aligning her dick with the bunny’s butthole. From your position, the hole she’s searching for is obscured by two sets of wide breeder’s hips. Her penetration is obvious though, and not gentle at all: the lusty laquine squeals in what can only be described as mindfucked joy.");
		output("\n\n<i>“FINALLY, FFFfffuCKING...!”</i> The perky ausar wails, quickly imprisoning the brown-furred muzzle between her lithe thighs. <i>“This is what you get for depriving me youuuUUU SLUT! You’ll only get to breathe when I cum! AND ONCE ISN’T ENOUGH!”</i> She shouts, already cumming once - she nearly collapses irate from the impact of orgasm. The bunny’s head is soon smothered by moist, randy dog.");
		output("\n\nYou see the gryvain shuffle over to the slut-bun’s splayed crotch and take her ever-erect [enemy.cock] in hand. What she does next widens your eyes: contorting her body into an awkward shape that leans her scaly legs over the kaithrit’s, she takes the bunny’s ballooning [enemy.cockType] shaft in hand. Wings spreading, she meanders the pirate’s [enemy.cockHead] under her leathery balls, aiming it at her dark blue pussy while she slips her cock in under the jumper’s dangling balls. You see the dragon slut’s weight shift, and she spears the rabbit and herself in one go. Did... did she really pull that off?! Folded like origami, a few of the tricksy rabbit’s muffled yet ecstatic moans reach your [pc.ears]. Were she not so fit and limber, she’d probably be bucking in pain right now. To your astonishment, she’s taking it like a champ!");
		output("\n\nThe threshing trio of former slaves go at their prey harder than before. The kaithrit humps and grinds in her ass, the gryvain merely swivels her hips while she’s helixed with the futa bunny, and the ausar... well, if she’s not spitting curses ineffective she’s raking her pussy with whiskered muzzle. One hand holds both lop ears together, the other guides the head they’re on, and her legs do the rest. As if she had a cock, she ruts against the thick tongue working overtime to get her off.");
		output("\n\nYou begin to shake and pant watching this brutal carnal display, briefly wondering how many credits you could make if you were to whip out your codex right now and start livestreaming it to some dishrag of a porn site.");
		output("\n\n<i>“You ff... You ffffFUCK!!!”</i> The ausar pants madly, stammering in pent up pain. <i>“Lucky for you, none of you bitches tried to stick mmeeeee with THROBB! I’d make you all choke on it if it’s the last thing I did! ALL OF IT, MORE!”</i> She howls, growling as if she were in heat. She must be, considering every toss and furious turn of her tail throws potent pussy juice and sweat in equal amounts, the scents traveling right to your nose.");
		output("\n\nTheir united groans carry loudly through the caves and you watch, hear, and practically <i>feel</i> them cumming again. You gasp and shutter your mouth when they detonate, the wet sounds and pheromones reaching you drive you straight into the wall of ruinous climax.");
		if(pc.isHerm()) output("Your [pc.cocks] and [pc.vaginas] tighten and blow, spurting and spurting and spurting ropes of [pc.cum] and [pc.girlCum].");
		else if(pc.hasCock()) output(" [pc.EachCock] swells with virile [pc.cum] and you can’t help but shower yourself and the rock beneath you in it.");
		else if(pc.hasVagina()) output("[pc.EachVagina] constricts " + (!pc.isTaur() ? "around your fingers ":"") + "and you feel yourself squirting [pc.girlCum]" + (!pc.isTaur() ? " all over your [pc.hand] and":"") + " the cracked floor underfoot.");
		else output("Your [pc.asshole] clenches and you feel the electrical shock of orgasm coast down your spine into your crotch.");

		output("\n\nThe three slaves rub themselves off in the laquine’s fur, using her like a towel to wipe their jizz off. The ausar sticks around just a bit longer to insult her further before stomping after the other two. Damn... For as spent as the jumper looks she sounds satisfied by what just happened! She rolls around in the afterglow, giggling to herself as cum drips from her abused holes, herself the star at the center of a homogenous puddle - her own rapturous galaxy.");
		output("\n\nNoticing an odd snake-like figure darting down a tunnel after the slaves, you vanish quickly. Your [pc.face] is red to the neck, but damn if that wasn’t a good diversion...");
		processTime(30);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// Scene 2
	else
	{
		output("\n\nThree slaves take advantage of the horny herm: two kui-tan males and a dzaan woman. A beta, by the looks of it, as there’s no pendulous cock swinging between her legs. The dusky woman kisses and gropes at the sweaty jumper, both of them on their knees, while the brown-furred rabbit gives the tawny men handjobs on either side. Her tiny, pretty paws must feel lovely around their shafts." + (pc.hasCock() ? " A shame they’re not around yours right now...":""));
		output("\n\nThe dzaan orally molests the lewd laquine’s mouth, both butt-groping hands being fanned by a wagging and sex-dripping tail. The jumper’s [enemy.cock] throbs between their taut tummies, rolling like a sausage between their guts. She doesn’t miss a beat with her kui-tan partners either: her small hands pump their rigids rods with hard, groin-rippling movements before switching to long, sensual rubs that end in a little glans teasing. The way they moan, the way the light reflects off her paw-pads ringing their moist tips, makes you moan like a helpless whore as well. You can almost feel some kind of phantom pleasure projected through time and space to affect you." + (pc.hasCock() && !pc.isTaur() ? " You mimic the laquine’s movements, rubbing yourself like she does the men, and nearly cum on the spot!":"") + " The shivers of near-orgasm run their course through you.");
		output("\n\n<i>“C’moooonnnn,”</i> you hear the jumper moan, <i>“I’m all for the touchy feely, but are ‘ya gonna mount me yet?”</i> She coyly asks.");
		output("\n\nWordlessly, the naked dzaan shoves the bunny bitch down and slithers over her, assailing the athletic bun with kisses up and down the sweaty fur, jerking the helpless pirate’s [enemy.cock] whilst grinding her glistening cunt against the shaft. She then leans forward and shifts her weight down, swiveling back on her knees, grinding that oversized [enemy.cockType] dick to its limits, teasing her urethra and fondling her balls at the same time. <i>“Oooh! Fuck!”</i> The rabbit squeaks with a buck of the hip, <i>“I’ll cummmmm!”</i>");
		output("\n\nOn cue, the dzaan plants one palm over the laquine’s [enemy.cockHead] and imprisons her girth in a vice grip, denying her orgasm while wiggling her thick tush in your direction. Mnf...");
		output("\n\nThe randy rabbit squirms and thrusts against the hand blocking her. <i>“Don’t edge meeeee come onnn! Heeeyy, we fucked a couple times, that’s worth something right? Right? I don’t cum just once!”</i> She makes a few more ‘innocent’ quips and bargains but the woman just giggles, keeping that silly slut down and desperate. The kui-tan kneel over the rabbit’s head and smear their sloppy cocks around her head and her ears. You can practically see the mischievous arc of lightning between their eyes as they glance down to their pirate fucktoy’s long, malleable ears.");
		output("\n\nGripping the lop ears of the moaning jumper, they each twirl the sensitive, sweat-soaked appendages around their throbbing, pre-beading cocks, using them as makeshift onaholes! The tips of their cocks rub against the softer skin of her ears. You can’t quite make out the laquine’s face from here, but you can definitely hear her passionate outcries: a mixed cocktail of pain and pleasure topped by barely cogent wails of happiness.");
		output("\n\nPre slips down to her eardrums as they both shift closer to her cute mouth. Her eager tongue lunges out for another taste of cum-packed kui-tan, soon engulfing both their cocks in her wet and soft maw as they jerk themselves with those handy auricles!");
		output("\n\nDrawing circles in her muscly torso, the dzaan exhales and crawls on top of the bunny again, yanking her legs up as she goes. The jumper’s [enemy.cock] stands tall like a ship’s mast, aligned perfectly with her slant-eared mistress’ oozing honeypot. The smog of lust, pheromone and musk together seeps down the connecting passages and especially toward you. The invisible cloud hits you like a suffocating wave of air, making you loudly gasp.");

		// PC not taur
		if(!pc.isTaur())
		{
			if(pc.isHerm()) output("\n\nYou finger your [pc.vagina] and rub your [pc.cocks] against your stomach, staining your [pc.legOrLegs] and [pc.skinFurScales] with translucent goo.");
			else if(pc.hasCock()) output("\n\nYou rub your [pc.cocks] against your stomach, staining your " + (!(pc.armor is EmptySlot) ? "[pc.armor]":"[pc.skinFurScales]") + " with pre.");
			else if(pc.hasVagina()) output(" You stretch your [pc.vagina] with all fingers, furiously jilling yourself to the precipice of orgasmic delight.");
			else output(" You hilt two fingers in your [pc.asshole] and cover your mouth as you violate your own butt.");
		}
		// PC taur
		else
		{
			output("\n\nThe fierce, obscene sex on display makes you shudder and gasp.");
			if(pc.isHerm()) output(" Your crotch feels numb, you slump and and grind your diamond-hard [pc.cocksLight] against your own belly. Your shaky hindlegs are glazed by a waterfall of [pc.girlCum] your needy pussy.");
			else if(pc.hasCock()) output(" [pc.EachCock] throbs, twitching so hard they ram into your underbelly, ropes of pre and watery ejaculate bridging the gap between your [pc.cockHeads] and the jagged floor.");
			else if(pc.hasVagina()) output(" [pc.EachVagina] clinches and oozes with orgasmic slime, so ready for a dick, a dildo, even a fist that sadly isn’t coming.");
			else output(" You squirm and slump, furiously groping yourself as you concentrate on the smells to bring about a suitable orgasm.");
		}
		// Merge
		output("\n\nYour [pc.eyes] can only focus on the dzaan, and the massive [enemy.cockNounSimple] sliding in and out of her slimy, silken folds. It’s like you’re watching a perfectly angled porn video, except in this instance you’re just a few feet away appreciating the view of a delicious, apple-shaped rump riding a pussy-gaping [enemy.cockNounSimple]. When her movements are just right, when the laquine’s legs flinch, you can see every tantalizing, ");
		if(pc.hasCock()) output("cock milking");
		else if(pc.hasVagina()) output("womb pinching");
		else output("gut clenching");
		output(" detail of velveteen sex. The elfin woman’s every rise and fall on the rabbit’s prodigious pole is punctuated by mouthwatering molds in her voluptuous frame.");

		output("\n\nThe dzaan moves passionately, almost sensually, controlling the jumper’s arousal with an inhuman grace. She pivots and tugs on furry feet when her back strains or the position becomes too boring, making sure her bottom doesn’t get used to anything. Casually hilting and sometimes teasing the [enemy.cockHead] around the entrance to her love canal, she swirls her gorgeous hips atop the pirate’s [enemy.cock]. Ringing moans announce her next body-fluttering orgasm, though the jumper’s is still far behind. A small price to pay for pleasing such a perfect mate. The shine of fresh girl cum polishes the bunny’s cock, giving her bulky balls an eye-catching gloss" + (pc.libido() >= 50 ? " that seems to beckon you out of cover":"") + ".");
		output("\n\nYou gulp when the domme gives you room to see the kui-tan again, both plowing the laquine’s mouth in turns. Wrapped in lapine ear, one thrusts in, and on the backstroke, the other thrusts in, maintaining a rhythm that’d make lesser whores gag. You still can’t see the horny hare’s face, but you’re certain she’s in <i>love</i> with what’s going on based on the rich, sultry groans coming from the pile of sex. Those sounds get more intense, and your arousal magnifies with the volume of their lovemaking.");
		output("\n\nThe dzaan releases the jumper’s legs and gives up on the smooth ride. She plants both hands on the bunny’s abdomen before slamming her crotch on the rabbit’s. Those galvanizing thumps would grind down a weaker pelvis, no doubt! Furry legs dangle and stray around the ruling domme. Both kui-tan jam their dicks into an overstretched jaw, their tapered tips opening the way for a surge of ‘nuki cream. The rabbit jerks their cocks at the base, hopelessly groping their smooth, contracting balls to get more and more before she, too, achieves climax.");
		output("\n\nThey all scream in unison as their orgasms hit home. Yours nearly join theirs as ");
		if(pc.isHerm()) output("Your [pc.cocks] and [pc.vaginas] swell and squirt thick loads of [pc.cum] and [pc.girlCum]");
		else if(pc.hasCock()) output("your [pc.cocks] fire" + (pc.cockTotal() == 1 ? "s":"") + " off painfully thick strands of [pc.cum] into the rocks just in front of you");
		else if(pc.hasVagina()) output("[pc.eachVagina] clenches and squirts a body-glazing batch of [pc.girlCum] onto you");
		else output("You buck and squirm with nearly an entire knuckle in your [pc.asshole], a thunderous climax wracking your whole body");
		output(".");
		output("\n\nThe rabbit fills her <i>“beta’s”</i> womb with a voluminous load of bunny batter, the alien’s belly bloating to the state of early pregnancy. The kui tan smear her head and neck with what’s left of their orgasmic drip and the dzaan teases the rabbit until her rhythmic, cum-coaxing spasms come to an end. With a long, satisfied sigh, she stands up and disregards her lay entirely, like nothing ever happened even as cum drains from her cunt. The three saunter off, having had their fill of hot, sweaty rabbit.");
		output("\n\nAs for the jumper, she lays there, basking in the glory that was a good, hard fuck. Her ears and mouth drip with fresh cum that she’s too tired to lap up. Her idle arms tremble, and she giggles like a drunken sailor. What a slut!");
		output("\n\nWith an exasperated groan, you get yourself together and get going - you just heard another pair of voices that don’t sound much like a pair of pirates. Red to the neck, you wipe the sweat from your collar, still shivering from the orgy you just watched.");
		output("\n\nAnd there are those sounds again... That jumper’s already back at it!");
		processTime(30);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Leave]
// Tooltip: Nah, you’ve got better things to do right now.
// PC Lust increases by 25
public function leaveDatOrgyBehind():void
{
	clearOutput();
	showJumpyGangbang();
	output("Shaking your head and yanking your [pc.eyes] off the raw fucking on display, you exhale hard and scamper away from the sexball. You’ve got better things to worry about than a carnal orchestra. The arousing effects of the performance can still be felt and heard, however...");
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}