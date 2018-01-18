//Night Trap's Christmas Dream thing
//https://docs.google.com/document/d/1U8HI7KH8auhnv3lTMpxP_QWHJAYXqWeE1-otQJOhDwU/edit#

public function clawsEmailText():String
{
	var eText:String = "";
	
	eText+="Season’s greetings, [pc.name] Steele!";
	eText+="\n\nThe New Texas Department of Wildlife and its employees wish you and your loved ones a very merry Christmas and the happiest of holidays. We encourage y’all to come on down for an old Terra-style, New Texas-size celebration. Nothing goes better with fresh-baked cookies than a tall glass of Treated milk!";
	eText+="\n\nWherever you decide to spend the holidays, may they be as happy as ours!";
	eText+="\n\nMerry Christmas,";
	eText+="\nNew Texas Department of Wildlife";
	eText+="\n\n<i>Attached to the email is an image of a few dozen bulls and a handful of cows at what seems to be an office Christmas party. They’re receiving presents from a tall hellhound dressed in a red suit that’s trimmed with white fur, who you immediately recognize to be Ciaran. It’s a safe assumption that he’s the reason you were sent this email.</i>";
	
	return ParseText(eText);
}

public function randyClawsHook():void
{
	clearOutput();
	clearMenu();
	author("Night Trap");
	showName("\nRANDY CLAWS");
	showBust("CIARAN");
	
	output("Something stirs you from your sleep. Groggily, you open your eyes to glance around your cabin. It being Christmas Eve, you’ve hung a stocking over the fireplace");
	if(ChildManager.numChildrenAtNursery() == 1) output(", along with another for your sweet little child");
	else if(ChildManager.numChildrenAtNursery() > 1) output(", along with others for your sweet little children");
	output(". " + (silly && ChildManager.numChildrenAtNursery() >= 20 ? "It was pretty hard to fit "+ChildManager.numChildrenAtNursery()+" stockings in such a small space, but through some sort of Christmas miracle, you managed it. " : "") + "The fire has died down to embers, indicating that it must be quite late in the night.");
	output("\n\nYou’re very glad you installed a fireplace in your quarters. Space gets so cold at this time of year!");
	output("\n\nAs you’re about to roll over and go back to sleep, you hear a clatter on the roof of your ship. It’s followed immediately by the sounds of dozens of tiny hooves. No way! This can’t be what you think it is! You throw off the sheets and dash over to the fireplace just as a pair of black boots lands with a heavy clomp in the ashes.");
	output("\n\n<i>“Santa?!?”</i> you call out excitedly.");
	output("\n\nThe bawdiest <i>“Ha! Ha! Ha!”</i> you’ve ever heard echoes up the chimney as a red-garbed figure emerges from the soot, bearing a huge sack on his broad, muscular back. He stands up to his full, considerable height before examining you with eyes as bright and red as the embers he’s standing in. <i>“Sorry, [pc.name], but you’ve aged out of Santa Claus’ program. Don’t worry though, his cousin is here now to stuff your stocking.”</i>");
	output("\n\nYour cheeks color at the incredible crudeness of this self-proclaimed replacement. You step back and take a look at the strange man. For the most part, he looks to be a middle-aged ausar with black fur and hair, though both are streaked with grey. His outfit is similar to traditional depictions of Santa, but with a few key differences: his hat sits between two bovine horns; his face is scruffy rather than bearded, cheeks scarred instead of rosy, and rather than pleasantly fat, he’s so buff that his sleeves threaten to rip. It’s also hard to miss that he’s eyeing you with frank lust rather than good cheer, and he’s either got a massive, dog dick-shaped candy cane in his pocket or he’s very happy to see you. For whatever reason, he looks oddly familiar...");
	output("\n\n<i>“Who are you?”</i> you ask, somewhat bewildered. You had expected Santa Claus, not... whoever this raunchy imitator is.");
	output("\n\nThe lusty alien laughs in disbelief at your question. <i>“Ha ha ha! What do you mean ‘who am I?’ I’m Randy Claws! I bring toys to the big girls and boys who have been nice, and I don’t mean stuffed animals and model trains. Naughty girls and boys get a bucket of switches, as in the kind you get spanked with.”</i>");
	output("\n\nRandy Claws drops the sack he was carrying and dusts some soot off of his pants. <i>“Well, kid, I made my list, but before I could check it twice, wouldn’t you know it? I lost the damn thing! So, I’ve gotta take your word for if you’ve been naughty or nice. Remember, your honesty here counts towards next Christmas!”</i>");
	output("\n\nThe holiday hunk is poised over his bag, seemingly awaiting your answer so he will know what to retrieve from it.");
	
	flags["RANDY_CLAWS"] = 1;
	processTime(5);
	
	addButton(0, "Nice", iWasAGoodSteeleIPromise, undefined, "Nice", "You’ve really been an awfully good [pc.boyGirl]. A good [pc.boyGirl] would never lie, right?");
	addButton(1, "Naughty", punishMeAndGiveMeSomeCoalFromYourSack, undefined, "Naughty", "Obviously, you’ve been a very bad [pc.boyGirl] this year. Practically the worst! It’s only fair that you be punished. Plus, would a good [pc.boyGirl] lie about being naughty if it meant they’d get a long, hard spanking?");
}

public function iWasAGoodSteeleIPromise():void
{
	clearOutput();
	clearMenu();
	author("Night Trap");
	showName("\nRANDY CLAWS");
	showBust("CIARAN_NUDE");
	
	output("<i>“Ha ha ha! I knew you were a nice [pc.boyGirl] the minute I laid eyes on you! In fact, I think you deserve something special.”</i>");
	output("\n\nThe Yuletide ausar closes his bundle before striking a more suggestive pose. <i>“Would you like to unwrap ol’ Randy Claws himself?”</i>");
	output("\n\nYou grin flirtatiously and answer, <i>“You promised earlier you’d stuff my stocking. I’m ready now.”</i>");
	output("\n\nRandy Claws grins in response to your answer like a hungry wolf. <i>“Well then, let’s not waste a moment. I’ve got quadrillions of other houses to visit tonight!”</i> He taps his nose with a clawed finger and nods, and suddenly, the both of you are naked! With inhuman strength and speed, Randy tosses you onto your bed before you can even blink. You’re rather alarmed at first, but when he flashes you a wink and a conspiratorial smile, you find yourself instantly calming down. In fact, it seems like the most natural thing in the world to just lie back and let him take charge of you, so you do just that.");
	output("\n\n");
	if(pc.isLactating())
	{
		output("\n\nThe ersatz Santa’s face lights up when he notices the [pc.milk] that’s already beading on your [pc.nipples]. <i>“Ah, my favorite: milk and nookie! You really are a good [pc.boyGirl], [pc.name].”</i>");
		output("\n\nYou actually find yourself blushing at the praise, but you’re not given even a moment to bask in it before Randy’s face is pressing forcefully into your [pc.breasts]. He latches onto your [pc.nipple] and lashes it with his canine tongue, tracing your areola before gently biting your teat with his sharp teeth. You yelp and reflexively try to pull away from him, but the ausar’s clawed hands grab you behind your shoulders and lift you towards him. ");
		output("\n\nPleasure and a small sting of pain combine into a dizzying mix, and you find yourself already gasping and clutching at his rock-hard back. When Randy actually begins sucking at your [pc.nipple], those gasps resolve into a whorish moan. You mash your " + (pc.hasBreasts() ? "boob" : "peck") + " into the alien DILF’s mouth, eagerly offering him all the milky flesh he wants. He greedily accepts, drinking your [pc.milk] faster than you can let down" + (pc.milkQ() >= 10000 ? ", a clearly supernatural feat given your inhuman lactic prowess" : "") + ". Another happy cry leaps from your [pc.lipsChaste] as Randy Claws reaches up and grabs your " + (pc.hasBreasts() ? "breast" : "flat chest") + " in a merciless vice grip, exerting just the right amount of pressure to cause your motherly bounty to flow even thicker.");
		output("\n\nThe ausar man milks you like a cow, emptying your " + (pc.hasBreasts() ? "breast" : "peck") + " in record time before moving on to the " + (pc.breastsPerRow(0) > 2 ? "next" : "other") + " and repeating his actions. Even at the incredible speed he’s moving, he still manages to pleasure you as if this were the most lavish breast worship imaginable. Your [pc.thighs] soon tremble, and as you feel the last of your [pc.milk] being hungrily sucked out of your lust-hardened [pc.nipple], you throw your head back and scream in rapturous boobgasm. ");
		if(pc.hasGenitals())
		{
			output("The pleasure centered on your chest quickly spreads to your [pc.crotch] in turn, and as you reflexively buck your [pc.hips] in ecstasy, you ");
			if(pc.hasCock()) output("spurt [pc.cum] ");
			if(pc.isHerm()) output("and ");
			if(pc.hasVagina()) output(pc.girlCumQ() >= 300 ? "gush [pc.girlCum] " : "squirt ribbons of [pc.girlCum] ");
			output("all over yourself and the sheets. ");
		}
		output("The ausar continues his ministrations throughout your climax, blissfully tormenting you with pleasure and hints of pain until stars fill your vision.");
		output("\n\nWhile you’re still gasping and coming down from your lactic ecstasy, Randy Claws releases your sore nipple and leans back up again. ");
	}
	output("He grins down at you with a lusty gleam in his fiery eyes as he strokes the pillar of canine flesh between his legs to full, throbbing hardness. It’s a fiery shade of red, and it’s warm enough that you can feel its heat through the cold air of the room, a carnal parody of a yule log, twitching and dribbling fat strings of spicy-smelling precum. Randy Claws coats his length in the slippery stuff, his efforts making lurid sounds that bring color to your cheeks anew.");
	output("\n\nWhen he’s finished, he grabs your " + (pc.isTaur() ? "tauric hind end" : "[pc.hips]") + " and drags your [pc.butt] to the edge of the bed, " + (pc.isNaga() || pc.isGoo() ? "" : "lifting your [pc.legs] into the air as well, ") + "putting you in position for what promises to be the quickie of a lifetime. Randy releases his searing doggy dong, the organ’s sheer size causing it to plop heavily onto your [pc.crotch]. His manhood radiates an unnatural heat, but it’s far from uncomfortable. It spreads into your groin first, filling you with heat that fast blossoms outwards to your core. There it resolves into a joyful warmth, almost exactly like the feeling of being wrapped in a cozy blanket with a loved one on a freezing night.");
	output("\n\nThe sensation makes you sigh blissfully, feeling serene and content until you notice a spurt of something hot and tingly on your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else if(pc.hasVagina()) output("[pc.cunts]");
	else output("featureless crotch");
	output(". You moan as the tingling feeling grows, your ");
	if(pc.isHerm()) output("hermhood");
	else if(pc.hasCock()) output("manhood");
	else if(pc.hasVagina()) output("womanhood");
	else output("bare groin");
	output(" instantly becoming inflamed with an incredible need to be touched and stimulated, distracting you from how the rest of your body feels perfectly at ease. When he sees the way your face looks as the two feelings war within you, Randy Claws looses another bawdy laugh. <i>“Ha ha ha! Don’t worry about that feeling, kiddo. That’s just what the Christmas spirit feels like when you celebrate the holiday the right way! Now, it’s high time for me to deliver your present.”</i>");
	output("\n\nA deep moan escapes you as you feel the pointed crown of Randy’s ausar cock slip down to your [pc.vagOrAss]. The tapered shape of his phallus allows him to nudge you open easily, and you can’t help but to throw your head back and cry out loudly as inch after burning-hot inch of thick alien dick stretches out your [pc.vagOrAss]. The ausar stud packs your tunnel full of his fat cock as fast as is comfortable for you, stopping only when your " + (pc.hasVagina() ? "labia are" : "anal ring is") + " beginning to stretch around his bitch-breaker of a knot. He only allows the beginning of its swell to slip into you, teasing more slutty cries out of you as the feeling of fullness pushes everything else from your mind.");
	output("\n\nIt’s impossible to focus on anything other than just how much cock there is inside you right now, and you find that your [pc.thighs] are already trembling after this first penetration. Your [pc.eyes] cross when Randy begins gyrating his hips. The motion stirs his hardness through your soft " + (pc.hasVagina() ? "folds" : "bowels") + " in the most delicious way, grinding into your ");
	if(pc.hasVagina()) output("g-spot");
	else if(pc.hasCock()) output("prostate");
	else output("depths");
	output(" while simultaneously producing squishing sounds that would make a whore blush.");
	output("\n\nYou could easily cum from this alone, but you’re not even allowed the chance. No sooner than you’ve adjusted to the massive insertion, you’re left whimpering in disappointment as your new favorite gift is cruelly taken away from you, leaving your [pc.vagOrAss] feeling achingly empty as Randy Claws drags his cock back out of your tunnel. You aren’t left suffering for longer than it takes to thrust back into you though, and your whimpering noises are transformed again into slutty cries of pleasure. The ausar laughs once more at your reaction, <i>“Ha ha ha!”</i> before he begins to fuck you in earnest.");
	output("\n\nThe raunchy, wet sounds of a thick cock stuffing a tight hole quickly fill the room as Randy saws his shaft in and out of your " + (pc.hasVagina() ? "box" : "backside") + " at a blistering pace. You tilt your head back into your pillow and grip the sheets, crying out" + (pc.isNaga() || pc.isGoo() ? "" : ", your [pc.feet] twitching nervelessly in the air") + " as your partner fucks you hard and deep. Randy Claws obviously knows his way around " + (pc.hasVagina() ? "a pussy" : "an ass") + ", as he still hits every one of your most sensitive spots with each thrust of his powerful hips, seemingly without conscious effort.");
	output("\n\nHe smiles down at you with a bemused look, though you only sometimes notice his warm gaze. You’re too busy shutting your eyes against the incredible pleasure of this frantic fuck to see anything other than starbursts of color behind your eyelids. You’re trying so hard not to cum already, but your partner is just too good. He knows every one of your sweet spots, and he fucks you tirelessly at top speed like a sex machine, never once slowing down or seeming in the least way like he might tire.");
	output("\n\nYou hold back your orgasm as long as possible, desperate to savor this incredible pounding at the hands of a supernaturally-skilled lover. It’s just not possible though. ");
	if(pc.hasGenitals())
	{
		output("As you’re biting your lip and panting on the edge of ecstasy, Randy suddenly reaches his clawed hands down to your [pc.crotch]. ");
		if(pc.hasCock()) output("\n\nHe grabs your [pc.cock] and begins jerking it hard, milking you from your [pc.knot] to your [pc.cockHead] with more pleasure than an onahole until you’re bucking your [pc.hips] frantically, powerless but to blow your load in his masterful grip.");
		else
		{
			output("\n\nHe ");
			if(pc.totalVaginas() == 2) output("stuffs your unused cunt and ");
			else if(pc.totalVaginas() > 2) output("stuffs your unused cunts and ");
			output("rubs at your [pc.clits] with his rough-furred fingers, peeling back your hood" + (pc.totalClits() > 1 ? "s" : "") + " to stimulate your pleasure buzzer" + (pc.totalClits() > 1 ? "s" : "") + " directly with more pleasure than a vibrator until you’re bucking your [pc.hips] frantically, powerless but to cream his cock under his masterful touch.");
		}
		output("<i>“Ha ha ha!”</i> You barely hear Randy’s self-congratulatory laugh over the rush of blood in your ears and your own screams of orgasm. You cum for what feels like an eternity, ");
		if(pc.hasCock()) output("splattering yourself in " + (pc.cumQ() > 10000 ? "gallons of " : "") + "your own [pc.cum]" + (pc.hasVagina() ? " and " : ", "));
		if(pc.hasVagina()) output("coating your [pc.thighs] in " + (pc.girlCumQ() > 300 ? "a [pc.girlCumFlavor] torrent of " : "") + "[pc.girlCum], ");
	}
	else output("\n\n");
	output("Randy thrusting into your spasming, clenching hole ");
	if(pc.hasCock()) output("and playing with your [pc.cocks] ");
	else if(pc.hasVagina()) output("and playing with your [pc.clits] ");
	output("throughout your climax until you’re writhing and screaming in overstimulated ecstasy.");
	output("\n\nYour nerves are so overtaxed transmitting pleasure that it takes you a moment to feel the ausar’s knot slam against your still-cumming [pc.vagOrAss]. By the time your neurons finally catch up to what’s happening, that breeding bulb is already being forced past your " + (pc.hasVagina() ? "puffy pussy lips" : "clenching sphincter") + " with a vulgar squelch. As Randy’s knot swells and stretches your [pc.vagOrAss] more than you thought possible, your entire nervous system lights up like a Christmas tree. Every axon flashes like a twinkling bulb, and when you feel the first shot of spicy, tingly cum paint your " + (pc.hasVagina() ? "walls" : "bowels") + ", the pleasure center of your brain lights up like the star at the top.");
	output("\n\nRandy Claws groans and sighs as he continues fucking you with short, jerky thrusts. He grinds his sensitive knot through your channel, reveling in your orgasmic contractions and pumping gallons of hot, creamy seed into you. The alien spunk rapidly begins to bloat your [pc.belly], stretching your middle out to the point that you look ready to birth an entire litter.");
	output("\n\nAs the tingly fluid coats your insides, your lust-wracked body and mind both begin to calm down. That cozy, peaceful feeling returns to you stronger than ever, no longer perverted by the lust that was burning in your [pc.crotch]. Randy Claws gently strokes your cum-stuffed [pc.belly] as he mutters to you in a soothing tone, <i>“I hope you enjoyed your present, [pc.name]. If you’re as good a [pc.boyGirl] every year as you were this year, then you’ll be enjoying it for a long time to come.”</i>");
	output("\n\nHe reaches into his sack and retrieves something before tapping his nose and nodding his head again. Through some act of Christmas magic, he manages to pop his swollen knot out of you. With the same supernatural speed he displayed earlier, he stuffs something into your " + (pc.hasVagina() ? "womanhood" : "[pc.butt]") + " before the sudden emptying of your even gaped, cum-dripping hole even registers. You look down in momentary confusion and are greeted by the most beautiful green and red bow you’ve ever seen. It rests atop your " + (pc.hasVagina() ? "pussy" : "anus") + " as if your orifice were a lavish present.");
	output("\n\nThat thought is confirmed by Randy Claws himself. <i>“Ha ha ha! Settle in for a long winter’s nap, [pc.name]. When you wake up tomorrow, give yourself to someone special, someone you think you could love. Your " + (pc.hasVagina() ? "pussy" : "ass") + " is a gift that should be cherished, and a good [pc.boyGirl] like you knows that it’s better to give than to receive!”</i>");
	output("\n\nYou nod your head with the last of your energy, muttering your agreement as sleep quickly overtakes you. The next time you blink, you’re tucked into bed, and Randy Claws is once again dressed and carrying his sack on his back. You notice that your stocking over the fireplace has been filled with various sex toys and bottles of lube. ");
	if(ChildManager.numChildrenAtNursery() > 0) output("Your child" + (ChildManager.numChildrenAtNursery() > 1 ? "ren’s stockings are " : "’s stocking is ") + "still empty of course. Randy grins at you and explains, <i>“I’ll be leaving those for my cousin to fill. I think it’ll be another 18 Christmases or so before I’m needed there!”</i>");
	output("\n\nRandy Claws steps into the fireplace with his sack and turns to face you one last time. With a wink and a grin, he bellows a farewell. <i>“Merry Christmas to all, and to all a hole tight!”</i> Then with a tap of his nose and a nod of his head, he springs up the chimney as quick as he came. Your eyes droop shut as soon as he’s gone.");
	
	processTime(25);
	pc.orgasm();
	
	addButton(0, "Next", thanksForStuffingMyStocking, false, "", "");
}

public function punishMeAndGiveMeSomeCoalFromYourSack():void
{
	clearOutput();
	clearMenu();
	author("Night Trap");
	showName("\nRANDY CLAWS");
	showBust("CIARAN_NUDE");
	
	output("Randy Claws tries to adopt a stern expression, though he’s betrayed by his slowly-growing erection. <i>“Hmmm. ‘The worst’ you say? Well, in that case, I think you need a special punishment.”</i>");
	output("\n\nYou nod your head in agreement, trying not to look too eager. It’s obvious that whatever’s in store for you, it’s not entirely a punishment, at least in the traditional sense.");
	output("\n\n<i>“Well then, let’s not waste a moment. I’ve got quadrillions of other houses to visit tonight!”</i> He taps his nose with a clawed finger and nods, and suddenly, the both of you are naked! With inhuman strength and speed, Randy dashes to the edge of your bed with you ass-up over his lap, all before you can even blink. You’re rather alarmed at first, but when he flashes you a wink and a conspiratorial smile, you find yourself instantly calming down.");
	output("\n\nHe traces his hand down your back and [pc.ass] with a deceptively light touch, prickling your skin with his claws as a reminder of what he could do if he wished. The sensation raises goosebumps on your tender flesh, and you shiver in anticipation of what the ersatz Santa has planned for you. Without any warning, he stuffs his thick fingers in your mouth, though he takes care not to scratch you.");
	output("\n\n<i>“Start sucking, you naughty [pc.boyGirl]! You’ll thank me in a moment.”</i>");
	output("\n\nYou do as commanded, eagerly sucking the furred digits and polishing them with your tongue. By the time Randy Claws withdraws his hand, your breath has quickened, and your cheeks are rosy from more than just the chill in the room.");
	output("\n\nThe ausar looses another bawdy laugh. <i>“Ha ha ha! Oh yeah, I think I’m remembering some things from my list about just how it was specifically that you’ve been naughty. Well I hope it was worth it, [pc.name], because now it’s time to take your lumps.”</i> Randy’s spit-slick digits find their way to your [pc.vagOrAss]. You wiggle your [pc.hips] enticingly, trying to coax the DILFy disciplinarian into penetrating you. Your efforts earn you a hard spank across your [pc.ass], causing you to yelp involuntarily and shiver in masochistic pleasure.");
	output("\n\n<i>“None of that, now! You’ve got to learn to behave yourself if you want to get on the nice list next year.”</i> He slips only the tip of his pinky finger into your [pc.vagOrAss], barely spreading your " + (pc.hasVagina() ? "lips" : "ring") + " with the merest hint of penetration. You moan in frustration and try to buck your [pc.hips] into his hand, but he withdraws his finger entirely and smacks your backside again in response.");
	output("\n\n<i>“Naughty, naughty! Do you want to be on the naughty list next year too?”</i> Though Randy Claws sounds like he’s scolding you, you can’t help but feel his massive canine cock poking into your [pc.belly] as he disciplines you.");
	output("\n\nYou pause, genuinely considering if you want a repeat of this next year. Another sharp slap echoes off your [pc.skinFurScales] when you delay too long.");
	output("\n\n<i>“Answer me, you naughty [pc.boyGirl]!”</i>");
	output("\n\nYou desperately bite your lip to hold in a masochistic moan, but your continued silence earns another spank. This time, a slutty cry escapes your [pc.lipsChaste], causing Randy Claws to laugh and his cock to throb in response.");
	output("\n\n<i>“Ha ha ha! That’s what I thought!”</i> He delivers a series of stinging blows to your [pc.ass], alternating between your cheeks irregularly and without a specific rhythm, sadistically preventing you from ever growing accustomed to the punishment being rained on your increasingly-red ass. The ausar teases you as he works your backside. <i>“I bet you want to be on the naughty list every year, don’t you?”</i>");
	output("\n\nYou bite your lip painfully hard in an effort not to moan too loudly as you nod in agreement.");
	output("\n\n<i>“Ha ha ha! I can’t believe there are still [pc.boyGirl]s as naughty as you out there! I’ll just have to see if I can change your mind on this.”</i>");
	output("\n\nSoon ");
	if(pc.hasCock()) output("[pc.eachCock] twitches out strands of pre-cum " + (pc.hasVagina() ? "and " : "as ") + "");
	if(pc.hasVagina()) output("[pc.eachCunt] dribbles [pc.girlCum] needily as ");
	output("your [pc.thighs] tremble with your mounting lust.");
	output("\n\nRandy Claws seems to take notice of your predicament, as he stops spanking you for the moment. Instantly, his cock prods your midsection in approval of your submissive arousal. Rather than act on his own needs though, the ausar stud suddenly stuffs two thick digits into your twitching [pc.vagOrAss] and begins vigorously fingering you.");
	output("\n\nWithout so much as a thought, you moan whorishly and work your [pc.hips] with the frantic energy of one approaching orgasm. Randy somehow knows right away where all your most sensitive spots are, and he pokes and prods at them with eye-crossing skill and speed. He soon fits a third finger into your hole to work your insides all the harder, stretching your entrance deliciously. Your moans rise in volume at an incredible pace, and faster than you thought possible, you find yourself on the verge of cumming your brains out.");
	output("\n\nAt the absolute possible last second though, Randy Claws pulls his fingers out of you, leaving your [pc.vagOrAss] agonizingly empty. You shout out with unbearable need, and " + (pc.hasVagina() ? "[pc.eachCunt]" : "your [pc.asshole]") + " clenches and spasms, trying futilely to draw the dominant alien’s hand back in to finish what it started.");
	output("\n\nAll that comes is a stinging strike to your tender ass, and it’s quickly followed by more of the same. You moan and yelp as Randy Claws resumes spanking you, tamping down your climax with delicious pain. While the hurt being inflicted on your sensitized [pc.skinFurScales] feels wonderful, it’s just not enough to get off on, so your whole body trembles and shudders as you’re backed down from the edge of orgasm agonizingly slowly.");
	output("\n\nOnce there’s no longer any risk of you cumming, Randy Claws begins fingering you again. Even faster than before, you climb to the heights of pleasure, and once more, you’re yanked back down before you can crest the summit. Your [pc.hips] twitch at random as you whimper and plead to be allowed release, but Randy Claws just laughs heartily at your begging.");
	output("\n\n<i>“Ha ha ha! I take it you’re sorry for being so naughty now?”</i>");
	output("\n\nYou babble an apology between pleas to continue masturbating you, which does seem to move the dominant DILF somewhat.");
	output("\n\n<i>“Well, I guess that’ll have to do for now. I’ll let you get off as a naughty [pc.boyGirl] one more time. Hopefully after I’m done, I’ll find you on the nice list next year!”</i>");
	output("\n\nAt first you think Randy might finally finger you to orgasm, but you soon realize with a sinking feeling what he actually meant. He continues edging you for what feels like an eternity, always switching to spanking you just before you can cum. Each time your lust nearly boils over, it diminishes a little less, until eventually, when you’ve been reduced to a twitching, writhing mess on the verge of tears, Randy Claws stops entirely. You don’t realize it immediately in your crazed state, but when you do, you turn and look back up at the brawny alien. Your eyes meet his own, his fiery orbs gazing down at you, their owner completely and utterly in control of you even at the summit of your pleasure. In that moment, when you finally and totally submit, he brings his powerful hand down in the hardest strike yet, nothing but sheer masochism pushing you over the edge you’ve been held at for so long.");
	output("\n\nYour [pc.hips] spasm maniacally, and you flail your limbs like a [pc.manWoman] possessed as your long-denied orgasm is finally unleashed. Your eyes roll back in your head, your hands scrabble at your partner’s muscly legs, and you groan like a huge weight has just been lifted from you. Randy Claws holds you still throughout your orgasm, preventing you from falling off his lap and hitting the floor. ");
	if(pc.hasGenitals())
	{
		output("Throughout it all, despite being untouched, ");
		if(pc.hasCock()) output("[pc.eachCock] frantically spurts " + (pc.cumQ() >= 10000 ? "buckets of jizz " : "") + "");
		if(pc.isHerm()) output("and ");
		if(pc.hasVagina()) output("[pc.eachVagina] " + (pc.girlCumQ() >= 5000 ? "squirts a lake " : "leaks a puddle ") + "of [pc.girlCum] ");
		output("onto the floor.");
	}
	output("\n\nBy the time you’ve finally begun to come down enough from your ecstatic high to be aware of your surroundings again, you’re face-down on your bed. It dawns on you after you get your bearings that there’s something sticky and tingly being rubbed onto your [pc.ass], which no longer hurt like it should. Nearly too exhausted to do so, you nonetheless manage to look behind you.");
	output("\n\nRandy Claws is slowly jerking his massive cock with one hand, coaxing thick ropes of spicy jizz out of his tapered crown to splatter on your abused [pc.skinFurScales]. With his other hand, he’s massaging the stuff into your [pc.ass]. His seed tingles when it touches your skin, but that tingling quickly dissolves into a cozy warmth, almost exactly like the feeling of being wrapped up in a warm blanket with a loved one on a cold night. That comfortable heat spreads outward from your [pc.ass] to your very core, and you practically liquify as the last hint of pain melts out of you.");
	output("\n\nWhile you’re still distracted, Randy Claws reaches into his sack of goodies and retrieves a small object. With the same supernatural speed he displayed earlier, he stuffs something into your [pc.vagOrAss] before you can even react. You gasp at the surprise penetration, looking back over your shoulder in momentary confusion to be greeted by the most beautiful green and red bow you’ve ever seen. It rests atop your " + (pc.hasVagina() ? "pussy" : "anus") + " as if your orifice were a lavish present.");
	output("\n\nThat thought is confirmed by Randy Claws himself. <i>“Ha ha ha! Settle in for a long winter’s nap, [pc.name]. When you wake up tomorrow, give yourself to someone special, someone you think you could love. Your " + (pc.hasVagina() ? "pussy" : "ass") + " is a gift that should be cherished. A naughty [pc.boyGirl] like you might not know this, but it’s better to give than to receive!”</i>");
	output("\n\nYou nod your head with the last of your energy, muttering your agreement as sleep quickly overtakes you. The next time you blink, you’re tucked into bed, and Randy Claws is once again dressed and carrying his sack on his back. You notice that your stocking over the fireplace has been filled with a bundle of switches and some skin cream. ");
	if(ChildManager.numChildrenAtNursery() > 0) output("Your child" + (ChildManager.numChildrenAtNursery() > 1 ? "ren’s stockings are " : "’s stocking is ") + "still empty of course. Randy grins at you and explains, <i>“I’ll be leaving those for my cousin to fill. I think it’ll be another 18 Christmases or so before I’m needed there!”</i>");
	output("\n\nRandy Claws steps into the fireplace with his sack and turns to face you one last time. With a wink and a grin, he bellows a farewell. <i>“Merry Christmas to all, and to all a hole tight!”</i> Then with a tap of his nose and a nod of his head, he springs up the chimney as quick as he came. Your eyes droop shut as soon as he’s gone.");
	
	processTime(25);
	pc.orgasm();
	
	addButton(0, "Next", thanksForStuffingMyStocking, true, "", "");
}

public function thanksForStuffingMyStocking(naughty:Boolean):void
{
	clearOutput();
	clearMenu();
	clearBust();
	author("Night Trap");
	showName("SHIP\nINTERIOR");

	output("A beeping from your codex rouses you from your slumber. With a tired groan, you reach for the high-tech device and silence it. Once you’ve managed to sit up and rub the sleep out of your eyes, you remember that it’s Christmas. There may be no fireplace in your room with a stocking full of " + (naughty ? "spanking implements" : "sex toys") + " hanging over it, but you have plenty of other reasons to get out of bed. While you’re still laughing to yourself about your ridiculous, lewd dream, you check the alert on your codex.");
	output("\n\nIt’s a message from Ciaran, and you realize with a blush exactly why Randy Claws looked so familiar. You decide it’s probably best not to tell Ciaran about your dream; you don’t want to give him any ideas. You open his message and read it with a growing smile.");
	output("\n\n<i>“Merry Christmas, [pc.name]!");
	output("\n\nI’m sorry I forgot to include any explanation with that office email. I may have been hitting the egg nog pretty hard when I sent that to you. Don’t worry though, the nog isn’t pressing charges. ;) ");
	output("\n\nI know this is one of your first holidays without your dad, so I just wanted to be sure you knew you didn’t need to spend the day alone. You can always come see me if you ever need someone to talk to, kiddo, no matter what day of the year it is.");
	output("\n\nYou’ve never told me if you’ve got kids of your own, but what really makes Christmas special is family. " + (flags["CIARAN_PAST"] != undefined ? "I played Santa for my little Celina every Christmas for 20 years, and those are some of my happiest memories. " : "") + "So if you have any little gremlins, go and visit them today! I hope you and yours have a merry Christmas!");
	output("\n\nBest wishes,");
	output("\nCiaran”</i>");
	output("\n\nYou almost can’t believe Ciaran sent you something so heart-warming. It always surprises you to see the hellhound’s tender side, but it certainly doesn’t lessen the sentiment of his message. It seems like a good idea to visit the nursery today. Christmas may not be all that special to most of the galaxy, but it’s always good to spend time with ");
	if(ChildManager.numChildrenAtNursery() == 1) output("your child");
	else if(ChildManager.numChildrenAtNursery() > 1) output("your children");
	else output("Briget");
	output(".");
	output("\n\nIt might not be a bad idea to follow the instructions Randy Claws gave either. You make a mental note to thank Ciaran for his kind message, then, after a quick check for any ribbons over your [pc.vagOrAss], you hop out of bed, filled with an entirely different holiday spirit than the kind from your dream.");
	
	genericSleep(420 + rand(80) + 1);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}