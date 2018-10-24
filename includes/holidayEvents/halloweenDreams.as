//Happy Halloween! If you've ever had sexy thoughts about the wall of hands in Labyrinth, then this is the encounter for you! I've also mixed in a common superstition ("hagging" or "choking ghosts") to make sure the haunting lingers a bit.

//Hands
public function handsDreamFromFrogapus():void
{
	clearOutput();
	showName("\nDREAM...");
	author("Frogapus");
	output("You drift off into sleep, feeling the world falling away beneath you. As blissful unconsciousness takes you, you are dimly aware of a faint touch against your body as you drift off.");
	output("\n\nYour eyes snap open.");
	output("\n\nThere’s something heavy pressing down on your chest. You try to make it out in the darkness, but can’t see much more than the shape of something shadowy sitting atop your reclined body.");
	output("\n\nYou try to sit up, but something holds you fast. Something’s pinning you down-you can feel hands gripping you shoulders, your wrists, ");
	if(pc.isTaur()) output("and all four of your legs.");
	else if(pc.isNaga()) output("and down the entire length of your body.");
	else output("your knees and your ankles.");
	if(pc.tailCout > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" Even your tail is caught in some iron grip.");
	output(" You open your mouth to yell, but can’t seem to find the breath for it. You’re aware of cold thighs pressed against your sides, and squint at the shadow on your chest, realizing that it’s something straddling you.");
	output("\n\nThere’s a dim, gray light coming from somewhere, and as you struggle against the figure pressing down on you. It looks vaguely female with long, black hair framing a featureless face. Your eyes adjust and you begin to make out a slim frame, white skin, and small, bare breasts. She’s leaning forward, her hands pinning down your shoulders.  Something about her arms seem <i>wrong</i>, though, as if she has too many elbows.");
	output("\n\nPinned beneath her, you can only gape in mute horror as her blank face splits open, revealing a glowing-red eye. You shout and struggle against the invisible grip on you, trying to break free. Her wrong-way arms push you down and you feel yourself sinking, sinking into the ground.");
	clearMenu();
	addButton(0,"Next",handsDreamFromFrogapus2);
}

public function handsDreamFromFrogapus2():void
{
	clearOutput();
	showName("\nHANDS");
	author("Frogapus");
	output("Helpless, you sink through the floor, pulled down, down down by the hands into darkness. As your eyes adjust, you become aware of movement all around you. In the wan, nowhere-light, you become aware of your surroundings. You’re in some sort of vertical shaft, stretching both up and down to an impossible distance. And the walls... your breath catches in your throat and you lurch backward.");
	output("\n\nThe walls are covered in hands!");
	output("\n\nReaching, grasping, flexing, thousands upon thousands of hands line the walls, running down to the endless darkness and up towards the distant light. The nearest ones seem to sense you, and reach towards you. You can feel their warm touch against your [PC.skin], grasping and holding you. You struggle, finding no purchase against the countless hands-they simply give way if you kick or shove, going slack if you pull." + (pc.canFly() ? " There’s not even enough room in here to fly away.":""));
	output("\n\nAs panic begins to set in, you become aware that the hands aren’t just holding you in place. The majority of them are starting to roam over your body. You shiver at their touch-warm palms cupping your cheek, light fingertips tracing along your [PC.ears]. Thumbs brush down your [pc.lips] as a trio of hands " + (pc.hasHair() ? "run through your Pc.hair, toying gently with it.":"run gently over your head.") + " Touches dance across your shoulders, while soft caresses run down your sides, from your ribs down to your [PC.hips].");

	output("\n\nYou moan involuntarily, as the countless hands explore your body. ");
	if(pc.biggestTitSize() <= 3) output("No less than four hands are splayed across your [PC.breasts]. Two of them mirror each other, caresses the subtle curves of your chest, while the other two pluck lightly at your nipples.");
	else if(pc.biggestTitSize() < 20) output("A half dozen hands cup and caress your breasts, warm palms pressed against them and massaging them gently, while others trace slow circles around your areola, fingernails delicately dragging over their stiffening tips.");
	else output("No less than a dozen hands are deployed across your massive jugs, pressing into your soft pillowness, swirling incomprehensible patterns across your areola, tugging and teasing at your nipples.][More than one row of breasts: It’s difficult to count the hands arrayed across your breasts, as their light touches alternate and overlap. It could be two or two dozen, cupping, caressing, teasing, and tugging.");
	output(" They slide their way down your thighs. You bite your lip as they grasp and squeeze the inner parts of your [Pc.thigh], sending shivers throughout your body. You can feel your resistance weakening, and it seems the hands can feel it as well.");

	//Dick
	if(pc.hasCock()) 
	{
		output("\n\nAt the first brush of a palm against your stiffening shaft [PC.cock] you flinch, feeling a globule of pre slowly ooze its way up your length. The moment it squeezes out against the questing hands, they redouble their efforts, smearing it down along your length, coaxing more oozing heat from your shaft.");
		//Dick>12 inches
		if(pc.cocks[0].cLength() > 12) output(" Another hand joins it,a subtle counter-rhythm that works your dick in time with the other, prompting a low moan from somewhere deep inside you.");
		//Multidick
		if(pc.cockTotal() > 1) output(" Soon, there are hands sliding up and down " + (pc.cockTotal() == 2 ? "both":"all") + " of your shafts at different speeds. You throw your head back, drowning in the pleasure flooding your brain.");
	}
	output("\n\nYou buck your hips, feeling two slim hands grasp your [Pc.butt] as you do, helping you push in time to the other hands. Even here, the hands massage and explore, pushing in deeply, squeezing your [PC.ass].");
	//Vagoo
	if(pc.hasVagina())
	{
		output("\n\nA solitary fingertip grazes up along your slit, and you shiver, a whimper of pleasure escaping your lips. More follow it, tracing, prodding, and exploring, your warming cunt. Your whole body convulses as fingers spread you wide, tracing up and down your sensitive inner folds. Shivers of pleasure radiate outwards, heating you up from head to toe. Your thighs shiver, as a finger, slick with your juices begins to probe inward.");
	}
	output("\n\nYou yelp in surprise as a finger presses against your butthole. You writhe briefly, unsure of where the hand is going, but the swarm of hands offers you no escape. All you can do is moan softly as a finger probes its way gently into your ass. A single digit, strangely slick, works its way in as other hands firmly grip your ass, keeping you from wriggling away. The same grip is mirrored by the hands holding your [PC.thighs] in place, countered by the delicate, feather-like touches against the inner portions of your thighs.");
	output("\n\nThere’s far too much to keep track of, and you surrender to the host of gray-lit hands and the flood of sensation washing over you. A thumb runs delicately across your lips, leaving a tingle in its wake. ");
	if(pc.hasCock())
	{
		if(pc.cocks[0].cLength() < 12) output("No less than three hands are working your dick now, two pumping in counter rhythm to each other, while another squeezes your balls in time to the other two. ");
		else output("There’s at least a half dozen hands working your massive shaft, each one stroking, teasing, and tugging in unison. ");
		if(pc.cockTotal() > 1) output(" A parade of hands is working your shafts, seemingly switching out between one another, stroking and working your dicks in a complex, sensual rhythm. ");
	}
	output(" Warm palms press against the small of your back, sending happy shivers up and down your spine.");
	if(pc.hasVagina()) output(" So many fingertips are playing with your cunt, tracing down your lips, teasing their ways in and out, and one relentless digit pushes against your clit, rubbing it in quickening circles.");

	output("\n\nBlindly exploring, hands run up and down your sides, while fingernails trace up and down your front, following the curves and lines of your body, lingering at just the right spots to make you squeak and pant. ");
	if(pc.biggestTitSize() <= 3) output("Light squeezes and playful grips play across your chest, groping your [PC.breasts] in irregular tandems.");
	else if(pc.biggestTitSize() <= 8) output("A host of hands descend on your breasts, each one of them stimulating you in a particular way. Warm palms cup beneath them, following the lush curve of your melons. Other trace the edges of your areola, fingernails teasingly close to your nipples. Soft grips alight here and here, attending to your jugs, leaving no square inch unattended for very long.");
	else output("It doesn’t make sense for so many hands to be covering your breasts, teasing, tugging, and caressing. There’s no way they could fit into the space, but yet they persist, fingertips tracing warm, sensual circles, palms rubbing, massage-light against your lush curves, fingernails dragging lovely lines across your globes.");
	output(" There are hands at your neck, controlling and firm. Some hands grabs your arms, holding them in place, while others run up and down your shoulders and forearms, matched in pace by the grips against your legs. There are two fingers probing your ass now, gently thrusting in and out, oblivious to the hungry whimpering spilling from your lips. A fingertip brushes back and forth along your taint. Firm grips lightly massage your [pc.footOrFeet]. A hand works two fingers into your drooling mouth, working in and out against your tongue as you groan in debauched abandon.");
	output("\n\nThere’s too much going on. You feel like you should be blacking out from the bombardment of sensation. Your breath comes fast as you rock in the grip of the hands, no longer desperate for escape, but for release. The hands seem to respond in kind, redoubling their efforts over your body, stroking and teasing until you’re squirming and moaning in mindless pleasure.");
	//Dicks
	if(pc.hasCock())
	{
		output("\n\nYou’re so overwhelmed that you almost don’t realize you’ve started cumming. All the pleasure on your body contracts to a single point as your " + (pc.cockTotal() == 1 ? "cock jumps":"cocks jump") + " and your whole body lurches. You gasp in the darkness as you release a thick, hot jet against the ministrating hands. The mess is hard to see in the wan light, but you can hear the cum splatter against several of them, and the hollow dripping noise as it rains down on the ones below.");
	}
	//Vagoo
	if(pc.hasVagina())
	{
		output("\n\nYour thighs feel like they’re dissolving under the onslaught of stimulation. When it finally builds to a peak, you’re almost thankful for the hands holding you in place to keep you from flailing your legs nervelessly. A rising tide of pleasure radiates out through you, making you toss your head back as your back arches. The fingers below you are drenched in a sudden gush of your pussy juices as you cum all over them. The mindless things don’t stop, though-they continue their work, coaxing another crashing climax from you. You howl in pleasure into the darkness as you cum again, and again, and again.");
	}
	output("\n\nBy the time three fingers work their way into your ass, you’re nearly insensate, half-broken by the continuous manipulation by the endless hands. It’s only the firm grip of the hands that keeps you from curling up into a ball as the fingers drive deep inside you, rubbing and probing at the slick walls of your ass, pushing you closer and closer to climax. With a soundless gasp, you buck against the hands, nearly dislodging yourself, but too lost in pleasure to care. The orgasm hits you hard, and the grip of the hands tighten, keeping you suspended in a dendritic sea as you thrash and groan in pleasure.");
	output("\n\nThey don’t stop. The pleasure doesn’t stop. You lose all sense of time, surrounded by infinite hands. Mindless and almost mechanical, they coax climax after climax out of you. The last, broken part of your brain wonders if this how you’ll spend eternity, caught in the grips of endless orgasm until the end of time.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",handsDreamFromFrogapus3);
}

public function handsDreamFromFrogapus3():void
{
	clearOutput();
	showName("\nA DREAM!");
	author("Frogapus");
	output("You lurch forward, gasping. The darkness is gone, and with it, the endless hands. You’re right where you fell asleep, blinking in the light. You whip around, half-expecting to see the bizarre cyclopean woman again, but finding nothing out of the ordinary.");
	output("\n\nYou wipe a damp smear of drool from your cheek, rubbing your eyes to clear them. It had seemed so real-<i>felt</i> so real. Your body is still tingling from the nightmare.");
	if(pc.hasGenitals()) output(" You glance down and note the still-warm puddle between your legs as sticky testament to the dream.");
	output(" It had to be a dream, though.");

	//First time:
	if(flags["FROG_HANDS_DREAM"] == undefined)
	{
		output("\n\nAs you get up to put yourself in order, your Codex squawks. You glance down at it, expecting an email notification, instead getting an eyeful of nonsense.");
		output("\n\nThe holographic display flickers, nonsense symbols and words scrawling across each other.");
		output("\n\n<i>“mA.re+++sayaa44null((REM sleep latency-GAWI nulim@@@dip-non-rapid-iiiiii_ogun_oru**”</i>");
		output("\n\nYou give your codex a shake, surprised at the sudden malfunction. The gibberish scrolls faster, and your codex squawks again, the display now dominated by a large, holographic eye. It flickers from side to side before snapping up to focus on you. Your breath catches in sudden recognition before the eye cuts out.");
		output("\n\nYou tap your codex again, quickly running through screens, dreading the recurrence of the eye. Thankfully, you don’t see it again.");
		output("\n\nYou take a deep breath and spend the next few minutes trying to shake off the clammy fear wrapping tight around you.");
	}
	//Second time:
	else if(flags["FROG_HANDS_DREAM"] == 1)
	{
		output("\n\nYou feel a cold shiver of fear running up your spine. Not again!");
		output("\n\nThe codex flashes static, displaying overlapping strings of nonsense.");
		output("\n\n<i>“..div_id: seroto||nergic_HAGHAGHAGHAGHAGHAGEOG traces shows that eye movement++liliyyotNOSCRIPT&&neural populations::dream-space=”</i>");
		output("\n\nYou know it’s coming, but still can’t stifle a shudder as the holographic eye appears again, focusing on you before winking out.");
		output("\n\nYou check your codex again, once more finding nothing. You frown, still shaking from the haunting glitch, and initiate a self-diagnostic.");
	}
	//Third time
	else
	{
		output("\n\nYou feel your skin crawl as your Codex lights up.");

		output("\n\n<i>“Characteristic+{cambion{{ fragBAKHTAKmentation+ofMARAselective_sera0000tonin_<i>malleus</i>reuptake_<i>malificarum</i>inhibitors<i>?subirse el muerto@@</i>”</i>");
		output("\n\nThe eye appears briefly, then flickers rapidly before dissolving into a shower of pixels.");
		output("\n\nYour codex goes blank for a moment, then plays a pleasant tune. A friendly message informs you that the codex has just encountered an unexpected error and needed to reboot.");
		output("\n\nYou eye the device warily as it goes silent once more. You’re not entirely sure what just happened.");
		//output("\n\nYou nearly jump out of your skin when your codex beeps again, informing you of a new entry.");
		output("\n\nYou nearly jump out of your skin when your codex beeps again.");
	}
}

/* Fen note:  cut all this.  I'm not having an empty codex spot in the sidebar all year for some halloween stuff. Hot scene tho.
Codex Entry: Kama-tanha

Name (Singular & Plural): Kama-tanha

Sexes: Female?

Height: variable

Weight: [error]

Hair: All incidents report black hair.

Eyes: Singular, red and illuminated. Victims report that this is the kama-tanha's only distinguishing facial feature. This singularprettyeye takes up the entirety of the face.

Ears: none

Features
Reports indicate a humanoid structure, with often-uncomfortable variance. Some encounters report disproportionate limbs, tails, wings, or multiple legs. Some constant features are: pale-to-white skin (often reported as cold), visible breasts, black hair, and a singular eyeamwatching.

Reproduction
Unknown. All victims report a sexual nature to the encounter, but range++eattheirpleasure=. Some victims recount intercourse with the kama-tanha itself, reporting a variety of genitalia. Others indicate that the kama-tanha is incidental to a dreamed or hallucinated sexual encounter

Encounters
Kama-tanha encounters are of questionable veracity, as many describe the encounters as dreams, or "dream-like," leading many xenobiologists to suspect that that the creature is a hoax or some kind of universal myth. Many point to roughly-parallel folklore present on most planets regarding sleep paralysis and REM states, implying thatkama-tanhaisreal+hangupsidedownfromdreams+fall&dig&leftwhisperleftleftalwaysleft_intonighhtlickyyoutouchyouinsideheads_showyou[pc.name]&againagaini.find_u
*/

//Witch's Kitten
//By: ThereWasAnAttempt
//For Dickhaving PCs
//7777 real winner contendah!
public function witchsKittenScene():void
{
	clearOutput();
	showName("THE\nWITCH...");
	author("ThereWasAnAttempt");
	output("The memory of how you heard of, let alone came to, the witch’s hut is already blurry in your mind, like it never happened, the details misting over in a vague sense of uncertainty. But the here, the now, that’s becoming more and more real as you squat before the woman who isn’t like any witch you’ve imagined. Dasima lounges in the corner of her hut, her gown the diaphanous silver of spider web, and about as revealing too. Through the thin silver strands you can nearly make out the hard nipples of her glorious mounds, her soft lips painted red and smirking at you while her eyes, golden as a cat’s, watch you. Tangled black hair descends to her knees, surrounding her like a shroud of darkness. She leans on the skull of a man, watching you from across the flames burning in the middle of her crowded hut. The smell of the herbs hung all around to dry waft to you, tantalizing and sweet.");
	output("\n\n<i>“You want to know about the crypt in the east?”</i> Dasima purrs, the sound singing up your spine to tingle in your hardening nipples and cock.");
	output("\n\n<i>“Ah, yes,”</i> you say, recovering a little as you look back into her eyes, trying not to stare as she shifts her legs, uncrossing them and revealing quite definitely that underwear is not a factor here. <i>“The one just outside Old Oak crossing. What do you know about it?”</i>");
	output("\n\n<i>“Enough to know a pretty young thing like you doesn’t stand much of a chance getting through it,”</i> she says.");
	output("\n\nYou flush a little, though feel a tingling in your groin as she talks down to you. <i>“I can take care of myself.”</i>");
	output("\n\n<i>“Of course you can, sweet thing,”</i> the witch giggles, her long finger stroking the skull resting near her hand. You feel oddly aware of the slow, lazy movement. <i>“I believe you.”</i>");
	output("\n\nYou swallow thickly, looking back to her shining golden eyes. <i>“Then you know a way in?”</i>");
	output("\n\n<i>“I do. I’ve gone in there a few times. You need a... special key to open those old locks.”</i>");
	output("\n\n<i>“You have it?”</i>");
	output("\n\nShe smiles, her red, red lips a cupid’s bow of amusement. <i>“Certainly. But nothing in life is free, little boy.”</i>");
	output("\n\nYou shift, your pants growing increasingly tight as she shifts, baring a bit more of her breast through the silver fabric. <i>“I... look. Can you stop calling me that?”</i>");
	output("\n\n<i>“Hmm. I’ll think about it.”</i>");
	output("\n\nYou sigh, letting it go. <i>“How do you open the crypt?”</i>");
	output("\n\nShe giggles. <i>“Hmm. Well, it’s a bit... different for everyone, little boy. For that, we’re going to have to use a special spell of mine, with the help of my familiar. Are you up for it?”</i>");
	output("\n\n<i>“I... guess...”</i>");
	output("\n\nShe smiles again. She does have a lovely smile... <i>“Good,”</i> she purrs, her voice stroking you so wonderfully. <i>“Now, we’re going to have to go into a trance. Can you do that for mommy?”</i>");
	output("\n\n<i>“I can... Sorry, what?”</i>");
	output("\n\n<i>“Nothing,”</i> she giggles, shifting. The front of her robe slips open a little more, and you catch yourself staring at the beginnings of a pearly white breast. <i>“Nothing, sweetie. Now. Look into the flames...”</i>");
	output("\n\nYou’re a little more wary now, but can’t muster up the grit to say no. It’s hard to say no to Dasima. You look down at the dancing flames as she tosses some powder onto the fire, smoke billowing up into the air, the flames turning a lurid red. You inhale a gust of the smoke, your head spinning. You blink rapidly, smacking your lips.");
	output("\n\n<i>“Good boy,”</i> Dasima breathes, a gentle breeze brushing your face. <i>“Just look into the fire. Listen to my voice. Are you listening, little boy?”</i>");
	output("\n\n<i>“Yeah...”</i> you murmur, staring into the writhing flames.");
	output("\n\n<i>“That’s it. Look deep. Let your thoughts drift away. Open yourself to my voice. Listen closely. Closer...”</i>");
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",witchsKittenScene2);
}

public function witchsKittenScene2():void
{
	clearOutput();
	showName("THE\nWITCH...");
	author("ThereWasAnAttempt");
	output("You blink, your eyelids drooping. Your head feels... heavy. Like someone was winding string around your brain...");
	output("\n\n<i>“Are you listening?”</i>");
	output("\n\n<i>“Yeah,”</i> you moan softly.");
	output("\n\n<i>“Good boy,”</i> she breathes, and her breath stirs the hairs at the back of your neck. When did she get behind you? She must have snuck around. Snuck around while you were listening to her voice. While you stared into the flames...");
	output("\n\n<i>“What a pretty boy you are. Has anyone ever told you that?”</i>");
	output("\n\n<i>“Yes... You did...”</i>");
	output("\n\nShe giggles again, and light fingers touch your sides, fluttering up your ribs like butterfly wings. <i>“I know that, silly little boy. But I mean others. Have others told you what a pretty boy you are? How slim and young. You look almost like a girl. Oh,”</i> she breathes, and your breath hitches as she grasps your tenting cock. <i>“But this says otherwise.”</i>");
	output("\n\n<i>“Mnnn,”</i> you moan weakly.");
	output("\n\n<i>“You’re so pretty and sweet,”</i> she murmurs, and you feel your shirt open, pulled away, baring your thin chest. <i>“So young and sexy and slim. Like a pretty kitty. Are you my pretty kitty?”</i>");
	output("\n\nSome vestige of masculine pride tingles in your head. <i>“I... I’m...”</i>");
	output("\n\n<i>“Now now,”</i> she breathes, you gasp, your pants opening, your cock stiffening in the warm air. <i>“Kitties don’t talk. Kitties just... mew...”</i>");
	output("\n\nHer slim fingers wrap around your manhood, and you moan weakly as she teasingly runs her fingers up and down your thickening shaft. Your head pounds, wrapped in a cloying fog of the smoke, of her words, wrapping you up tighter and tighter until you feel like your head could burst.");
	output("\n\n<i>“Pretty kitties shouldn’t come all alone to meet with pretty witches. But you’re so brave, aren’t you, kitty?”</i>");
	output("\n\n<i>“Mmmn,”</i> you moan weakly, your hips twitching as she slowly pumps your cock.");
	output("\n\n<i>“That’s a good kitten. Only mews now. Pretty little meows that tell me what a slutty, pretty kitty you are. And every witch needs her cat, you know. Are you my pretty kitty?”</i> You feel her hot lips against your neck. You moan as her tongue slides along the sensitive flesh. <i>“Are you?”</i>");
	output("\n\nYou’re panting, gasping, trembling at the heat that suffocates the little hut. <i>“I... I’m..”</i>");
	output("\n\n<i>“Turn around.”</i>");
	output("\n\nYou do, and come face to face with her golden eyes. She smiles broadly, then leans back so you can see her more thoroughly. Her long black hair frames her pale body starkly. Her spiderweb dress has slipped aside fully now, baring the immense globes of her breasts. Your breath deepens as you stare at those heavy mammaries, nipples dark, hard, and jutting. Lower still lies the pink gash of her pussy, damp with dewy desire.");
	output("\n\nShe cups her breasts, giving them a gentle squeeze. <i>“Mmm. I think kitty likes seeing Mistress like this,”</i> the witch giggles as she lazily lifts and squeezes her fat teats together, her fingers spreading your shining pre all over the glorious orbs. <i>“I think my slutty little kitty would like nothing more than to lick and kiss Mommy’s breasts. Doesn’t he?”</i>");
	output("\n\nYour thoughts are so twisted around you can only nod, taking her words as fact. And why shouldn’t you? Mommy is so smart and sexy and knows just what you want.");
	output("\n\n<i>“That’s a good kitty,”</i> she purrs, and your body sings to her tune. <i>“That’s a very good kitty. And what does a kitty get as a treat?”</i>");
	output("\n\nYou stare, breathless with anticipation. What? What does a good kitty get? She edges you like that for a terrible minute, all the while massaging her big, pale, wonderful tits.");
	output("\n\n<i>“Kitty,”</i> she breathes, her fingers closing on her hardened nipples. <i>“Gets cream.”</i>");
	output("\n\nHer fingers squeeze. The witch shudders, her lips parting in a heavy moan as a sudden spurt of milk jets from her nipples. The warm milk splashes on your legs. You mewl desperately. Mommy giggles again and opens her arms. <i>“Come to Mommy, Kitty.”</i>");
	output("\n\nYou surge across the floor and into her arms. You bury your face in the heavy orbs of her milky teats, your lips latching onto a jutting nipple. Hungrily you suck.");
	output("\n\nBliss bursts through you as that wonderful milk touches your tongue. You mewl, sagging, weakening in her arms as your lips hungrily suckle her gushing cream. Mommy moans, hugging you to her fat teat.");
	output("\n\n<i>“Ooooh yessss kitty. Mmnnn. Yes. Suck M-Mommy’s milk. That’s it... Ah... oooh, such a good kitty for Mommy. So... ah... good...”</i>");
	output("\n\nYou mewl with pleasure as her warm cream soothes away the pain in your head, washing away anything but your love for your Mommy. Every good kitty loves their Mommy, and yours is so wonderful. You gasp weakly as she touches your hips, pulling you nearer. Your cock is enveloped in velvety softness, and with a sigh you begin to thrust.");
	output("\n\n<i>“Yessss kitten. That’s it... that’s good. Yes. Ah... yes... Sweet thing. That’s my good kitten. Mnnn... that’s a very good kitty...”</i>");
	output("\n\nYou bury your face deeper in her teat, lazy pleasure roiling through your svelte form as you pump into her hungry cunt. Oh it feels so good. So wonderful to be Mommy’s sweet kitty. To be wrapped in her arms, buried in her cunt.");
	output("\n\n<i>“That’s right. Let it all slip away, kitten. Drink up. Drink. Let everything just... fade... everything but being Mommy’s slutty kitty. Mommy’s needy... ah... thirsty kitten...”</i>");
	output("\n\nYou pant, gasping as Mommy’s cunt ripples around you, as she gasps, her orgasm threading through her and making her shudder around you. The sensation pushes you past the edge. With a cry you cum, your cock pumping your slutty seed into her.");
	output("\n\n<i>“Ooooh that’s it kitten. Yessss!”</i>");
	output("\n\nYou keep pumping. Keep going. Surrounded by her flesh, your face buried in the pillowy softness of her tits. You feel weak. Soft. Vulnerable. But you don’t worry. Mommy is here to protect you. Mommy has you now. Once, you vaguely think, you would have tried to protect yourself. But that’s in the past. That would take away from your servicing Mommy. From obeying mistress.");
	output("\n\nYou feel her hands move, and then something wraps around your throat. You lift your lips from mommy’s teat for a moment and look down at the black collar around your neck. A golden bell dangles from it.");
	output("\n\n<i>“For Mommy’s precious kitty,”</i> she says with a warm smile.");
	output("\n\n<i>“Mew,”</i> you whimper.");
	output("\n\nMommy giggles. <i>“Good boy. Now, I think you have another job.”</i>");
	output("\n\nYou don’t need to wonder. Don’t even need to think, for Mommy at once moves your head towards her other breast. With gusto you suck at her hard nipple, suckling at her sensitive breast, delighting at how she quivers and moans and shudders, how in turn her pussy squeezes and massages your cock as you lazily pump in and out of her.");
	output("\n\n<i>“That’s... ah... it... kitten... So... so good. M-mooore. Moooooore!”</i> she moans.");
	output("\n\nYes. More. As much as she wants. For as long as she wants. Kitten will always be there for mommy. Will always be her eager tit slave.");
	output("\n\n<b>At least... until you wake in the morning with the sheets " + (pc.cumQ() < 100 ? "wet":"soaked") + "... What a dream!</b>");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Demon Sera Ship Rape
//By Hatchford
//Requires been intimate with Sera, have crewmembers, have crew Anno, crew Sera, and 4+ crew
public function demonSeraShipRape():void
{
	clearOutput();
	author("Hatchford");
	showBust(seraBustDisplay(true))
	showName("\nA DEMON!");
	output("Foggy-headed, you trudge up to your ship, exhausted from a long, hard day of fucking the natives silly.  Visions of a hot meal and warm bath dance before you as you mechanically enter the code.  The door doesn’t budge.  Cursing, you attempt to focus and re-enter the code.  Shit!  You enter it again, this time with exaggerated slowness, feeling like an idiot.  ‘1’, ‘2’, ‘3’, ‘4’, ‘5’, ‘6’...fuck.  You headbutt the door in a foolish fit of rage.  If this is another of Sera’s fucking pranks...");
	output("\n\nSuddenly, the door whips open and an impossibly large form ducks through and forces you backwards with its bulk.  It straightens and rises...and rises...and rises, looming over you.  You gulp in fear as you try to tell yourself that you’re hallucinating the twenty-foot tall demon that’s grinning evilly down at you.  Your vocal chords try futilely to say something, anything, as you fumble for your weapon, but before you can manage it the demon chuckles and spreads its wings.  You’re buffeted by a wall of air and driven to your knees as it lifts off and streaks into the sky.");
	output("\n\nRegaining yourself, you stumble through the door and try to slow your pounding heart.  The power has apparently been shut down and the emergency lighting pulses faintly, giving the passage way an eerie feeling that keeps your pulse elevated.  The normal sounds of the ship are gone as well, there’s no hum of the systems, no chatter from your crew...what in blazes did that demon do?");
	output("\n\nYou go searching for some explanation, but every compartment is empty and no system will respond to your attempts to restore it.  Finally, you approach your quarters, the last stop on your ‘tour’.  A faint slapping noise can be heard through the door.  You shudder in relief as your growing fear that the demon had wiped out your crew is assuaged.");
	output("\n\nRushing through the door, you fall flat on your face as you trip over the legs of ");
	//[a crew member]
	var crewNames:Array = getCrewOnShipNames();
	var x:int = 0;
	var crewName:String = "";
	//Pick a random crew member. If it's a restricted on, toss 'em and loop again, then set the name.
	while(crewName == "" && crewNames.length > 0)
	{
		x = rand(crewNames.length);
		if(crewnames[x] == "Sera" || crewNames[x] == "Anno") crewNames.splice(x,1);
		else crewName = crewNames[x];
	}
	output(crewName + ".  Dazed, you scan the room and gaze in wonder.  The back of your mind does a roster check as you try to comprehend what you’re seeing. They’re all here, thank the heavens for that at least.  Here, and sprawled, butt-naked on the floor in a haphazard pile.  Every damn one of them has a goofy expression of bliss painted on their face and cum splattered over their faces and leaking from every orifice.");
	output("\n\nThe fuck?");
	output("\n\nThe slapping noise again intrudes on your befuddled mind and directs your attention to the only two people not in a lust-induced coma.  Anno is bent over your bed, ass in the air and a dreamy smile on her cute face as she’s jolted again and again, her luscious flesh jiggling in a way that makes your body heat up despite the oddness of the situation.");
	output("\n\nBehind her, one hand gripping that lovely ass and the other planted firmly in Anno’s upper back, pinning her to the bed, is Sera.  You get the feeling that she’s aware of your undignified entrance, but she doesn’t acknowledge you and continues to abuse Anno’s hole with vigor until she hilts herself completely and begins to spasm into the ausar.  You can easily imagine the delightfulness of that hot juice squirting into Anno and she evidently shares your feelings, groaning something unintelligible as her eyes roll back into her head, body quivering.");
	output("\n\nSera pulls out with a wet 'schlorp' and lets Anno’s now boneless form slide gently to the floor to doze quietly amongst her similarly fucked-out crewmates.  The smirk on her face as she turns to you sparks an indignant rage and you start to rise to confront her properly, but before you can blink Sera...shifts and is instantly behind you, stiletto heel planted firmly in your back.");
	output("\n\n<i>“Fun’s over, meat.”</i>");
	output("\n\nHer tail wraps securely around your neck as she lifts her heel off of you and rips your clothes to shreds.  As she works she begins to explain just what the demon visitor gifted her and outlines her plans for the future and for you.  Your horror grows to the point that even if she released her tail your frozen limbs would keep you presenting yourself to her.  It’s only when her demonic cock rams into your traitorous and welcoming asshole that you’re brought back to the present from the vision she’s painted.");
	output("\n\n<i>“Your ass is now mine.”</i>");
	output("\n\nA part of your mind rebels at that, but the roiling sensations of a foot-long cock speared in your guts overwhelms you and you decide that you’ll allow this wonderfulness to continue until she’s done.  And <i>then</i>, then she’ll get what she deserves...");
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",demonSeraShipRape2);
}

public function demonSeraShipRape2():void
{
	clearOutput();
	showBust(seraBustDisplay(true));
	showName("DEMON\nSERA");
	author("Hatchford");
	output("Sera doesn’t even give you the dignity of dragging you to the bed, but instead keeps you in the pile of crew, occasionally, and forcefully, pushing you into whatever overflowing pussy or ass is in reach until your face is as smeared with sperm and girlcum as are your insides.  Hours pass with her rock hard meat plunging into you until your brain is disintegrating with cocklust...that’s when the training really begins.");
	output("\n\nIt doesn’t take long in the end.  A few weeks of nothing but drinking down demon cum and having your holes blasted with cock eventually transforms you into the willing cock sleeve she always wanted you to be.  You remain as CEO of Steele Tech, but only as a figurehead, Mistress now wields the real power.  But that’s okay, you’re plenty busy keeping your master’s cock well-pleased, in addition to caring for the demon babies she continually  plants in your " + (!pc.hasVagina() ? "new":"") + " womb.");
	//output("\n\nUsing her knowledge of modding to ensure they gestate and grow to maturity rapidly, Mistress enrolls them in what she calls the Institute.  She runs classes to mold them in her image, passing on her skills and beliefs while installing you as the graduation exam.  Broken as your mind is, and devoted to your Mistress as you’ve now become, there’s still a tiny part of you that recoils when your firstborn daughter commands you to suck her cock.  There’s no question of disobeying, however, and you quickly jump into your new duties with a passion, bursting with pride as your progeny skillfully and completely dominate you as they stuff you full of their demon cockmeat and leave you sprawled and dripping with their yummy cum.");
	output("\n\nIt’s a gift, really, to be allowed to be a part of this and you make certain thank your Mistress nightly, eagerly slurping her magnificent rod and sucking down her cum as she drifts into sleep, proud to help her get her rest and keep strong on her quest.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cum Monsters
//By Foxxing
//Note: Submission for the halloweiner contest. Premise is the player is cum filled (vaginally, orally or analy) and somehow that cum gains mass and sentience (is a mystery) before rocking the pc’s world. I initially was going to make it all a single scene with variation for different types of cum but decided to make each one its own self contained thing to make coding each variant of the scene easier.

//Oral Cum Event
public function foxxlingsOralCumDream():void
{
	showName("\nCUM");
	author("Foxxling")
	/*
	output("As you try to fall asleep you can’t seem to get quite as comfortable as you want. First you’re twisting and repositioning, then you’re stretching and leaning in an attempt to find that perfect position. " + (silly ? "The crazy thing is that sleep is normally as easy as pressing a button for you but for some reason you just can’t get there.":"You irritably wonder what kind of evolutionary advantage insomnia could possibly have and why no species has evolved past it."));
	output("\n\nAfter a while your ceaseless efforts are rewarded as you find a reasonably comfortable position and try to drift off... but, of course, you’re suddenly thirsty. You don’t want to get up just to get a mouth full of water from your ship’s tank so you try to ignore the feeling and begin thinking about your day.");
				Maybe cut before  this? */
	output("Suddenly there’s a very familiar taste on your [pc.lipsChaste] and the back of your throat. When you take a moment to consider the oral nature of your recent activities, it makes sense that you would taste such a thing.... Actually come to think of it, that is something you never should have stopped tasting. After all, cum doesn’t just disappear and reappear like that. With a shrug, you dismiss the thought and snuggle back into bed, happy that you’re, so conveniently, no longer thirsty.");
	output("\n\nAs you close your eyes, your [pc.belly] begins to feel a bit more squirmy than usual. You try to ignore the feeling until you feel your [pc.lipsChaste] getting wet, as if you’re drooling for some reason. It’s very odd considering how parched you were a second ago. Feeling more than a little annoyed, you sit up and turn on the lights.");
	output("\n\nWait... that doesn’t taste like spit.");
	output("\n\nPutting your hand to your [pc.face] you reel back in surprise as the ejaculate in your throat begins to fall from your lips like a waterfall. Somehow it isn’t obstructing your breathing, but stars! Where the fuck is all that even coming from? When you think to go grab a bucket, you slip in the mess streaming from your lips and fall. You brace yourself to hit the floor but instead are engulfed by a pool of spunk. As the bottomless lake of jizz absorbs your momentum, you can’t help but wonder how did this puddle become an ocean? There is no way you swallowed this much cum.");
	output("\n\nSuspended in the liquid, you thrash around for a moment only to realize that somehow you’re still able to breathe... that is until you feel the all too familiar feeling of a cock being shoved down your throat.");
	output("\n\nThe cock-shaped cum unceremoniously travels down your gullet, becoming one with the reservoir of semen spewing from your maw which forms into bigger, thicker version of its former self. You hear a gasp of contentment from somewhere above as you begin to suck. You feel yourself getting aroused, your hand reaching down to rub your [pc.groin] in that weightless sea of cum. You relax, the slow repetitive task of a lazy suck combining with a soft arousal. Yawning around the cock in your mouth, you can’t help but think, <i>“Now this is comfortable.”</i>");
	output("\n\nYou awake with a start, and then can’t help but chuckle at yourself for dreaming such lewd things. As you recount the events it becomes more and more obvious that it was a dream. You’ve never even seen that bedroom before. As you rise to get your day started, though, you almost slip on what looks like a few droplets of the cum from that very dream. Strange.");
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal Cum Monster
public function analButtCumMonster():void
{
	showName("\n...CUM...");
	author("Foxxling");
	output("Before you get into that deep, second stage of slumber, you feel something on your [pc.ass]. Unwilling to deal with whatever it is, you wiggle your butt in an attempt to get away from the offending sensation. When it stops, you simply smile and try to doze off again.");
	output("\n\nThat’s when a very wet slap lands on your [pc.ass].");

	//if pc is naga:
	if(pc.isNaga())
	{
		output("\n\nYour [pc.eyes] snap open as you hurl yourself away from that slap, not that it hurt. Your lower half has become wrapped in the blanket, so you take a second to disentangle yourself, your [pc.ass] hitting the air as you do. Looking down at your lower half, you feel like something is a little... off. However you can’t seem to remember if you were naked when you went to bed.");
		output("\n\nYou shrug off the odd feeling and glance around the room, rising onto your coils you make yourself taller in an attempt to see if there is anyone hiding and playing a prank on you. Suddenly you feel strong slimy hands bending you over, smashing your [pc.face] into the bed. Glancing back, you see that the hands forcing you down are not only dripping, gooey limbs, but they’re also coming from your [pc.ass]!");
		output("\n\nThe creature ignores your confusion as it forces you back down. Inside your [pc.asshole], you feel a something long and phallic forming, most likely from the remnants of all the cum that has been buried in your back door. A gooey creature grows and shifts from the jizz, becoming an androgynous humanoid, and once it has feet, it uses them to drill its thick cock deeper into you. You squirm in an attempt to lessen your discomfort but instead end up hanging off the edge of the bed. As you try to relax, it begins to grow, gaining in length and girth until you feel so full you might break. In the end you can’t help but wrap your [pc.legOrLeg] around its legs. The creature simply puts its feet together and begins fucking downward, that giant dick giving you every inch you could possibly handle.");
		output("\n\nSoon the androgynous cum monster is railing you good, its legs being bound by yours only serves to make it fuck you even harder. With every thrust, its trunk wetly claps against your [pc.thighs]. Despite how big it feels, you can’t help but love every second of it. The creature knowns your [pc.asshole] almost as well as you do, which makes sense considering where it came from.");
	}
	//if pc is taur:
	else  if(pc.isTaur())
	{
		output("\n\nYour [pc.eyes] snap open as you twist around and heave yourself up, all the while casting around to see who the fuck just slapped you on the ass. Figuring it must be some asshole playing a prank, you canter about the large room, keeping your bed to one side as you search. Yet as you circle around to your starting position, you notice you’re leaving a very thick trail of... is that jizz?");
		output("\n\nYou twist in an attempt to see what is going on with your back half. Did you even go to sleep naked like this? You honestly can’t recall, but you certainly remember how some cum would have gotten in your [pc.asshole]. As you think about how much spunk is sitting in your hole, you see something move out the corner of your eye. You take a few steps back only to see that the cum you’re leaking is suddenly coming straight at you!");
		output("\n\nYou yelp as the spunky aberration hoists you up, transforming from a wave of spunk into strong gooey hands that painlessly support your weight despite your thrashing. You kick at the goo for a moment until you feel something long and phallic forming inside your [pc.asshole]. It moves through your insides, becoming an ever-expanding, slimy steel rod as it grows and grows. You can’t help but moan as the hands that once held you up put you down and slide up your flank, combining with the tool growing out of your [pc.ass] to form an androgynous centaur.");
		output("\n\nThe taur-like cum-monster wastes no time, ramming its rod into you with a thrust of its powerful hips. It’s forehooves become forearms, holding you and pulling your entire body back toward its trusts. Its long strokes are punctuated by a wet staccato rhythm as its giant stallion-cock beats your [pc.asshole] inward.");
		output("\n\nSoon, your androgynous creampie-born aberation is railing you good, its humanoid half squealing with glee above you. The arms in place of its front legs continue yanking your body back as it stabs your insides with a now a cacophony of erotic violence. You’re being stretched to the max and you can’t help but love every second of it. The creature seems to know your [pc.asshole] almost as well as you do, which you guess makes sense considering where it came from.");
	}
	//if pc is biped:
	else
	{
		output("\n\nYour [pc.eyes] snap open as you fly out of your perfectly perfect sleeping position, still under the covers as you cast about for whatever jackass is fucking with you. There is no way you could have imagined such a sensation, yet someone could always be playing a prank on you. In an effort to find answers, you lean over and check to see if someone is hiding under the bed. As you do, you feel your blanket sliding off, fresh air hitting your [pc.ass] in the process. This causes you to pause for a second because something feels... off. However you can’t seem to remember if you were even naked when you went to bed.");
		output("\n\nShrugging off the weird feeling, you go ahead and check under the bed only to find absolutely nothing there. That is when your [pc.leg] slides against something wet. Before you can get up there to see what the fuck that was, you feel two goopy hands hit your lower back, holding you down as something wet, slimy and erect forms inside your [pc.asshole].");
		output("\n\nLooking over your shoulder, you watch in horror as a gooey monster forms, an androgynous humanoid that appears to be made of all the spunk you’ve had deposited deep into your back door. Stars that thing’s cock is huge too, filling you up and gaining in both length and girth until you’re so stuffed that you have to spread your legs to let it grow.");
		output("\n\nSoon, the androgynous cum monster is railing you good, hands snatching you back as every thrust propels you forward. Its trunk wetly claps against your [pc.thighs] as your hole is stretched to the max, and you can’t help but love every second of it. The creature knowns your [pc.asshole] almost as well as you do, which makes sense considering where it came from.");
	}
	output("\n\nAs the gooey cum-beast continues to pound you into senselessness, you feel gravity shift, and suddenly you’re falling... until your head hits the floor of your room. Looking up, you realize you’ve hit the deck, quite literally. With a chuckle you figure it must have all been a dream and silently smile at the crazy things the mind is capable of coming up with. As you get up and dust yourself off a bit, though, you find remnants of spunk on your fingertips, the very same cum that the creature from your dream was made of.");
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



/* UNCODED: Vaginal cum dream by Foxxling. His writing needs plenty of touching up and there's others I'd rather pursue first. Maybe 'cum' back to later?

output("\n\n");
output("\n\nVaginal Cum Beast");
output("\n\n{if pc is vaginally filled:");
output("\n\nFeeling heavy with exhaustion you decide it is time to go to sleep, good thing you’re already in a nice and cozy bed. With a yawn you take a second to relax, getting more comfortable and finding that perfect position. You’re settling in for a relaxing slumber when, suddenly, you feel wide awake. With an irritated huff you stubbornly snuggle deeper into the very inviting bed. It takes a second to realize you’re really just not feeling it anymore. It is crazy because you were dog tired literally a few moments ago but now no matter how comfortable you get you just can’t drift off into the sweet land of dreams. So you figure you’ll wait, silently with your [pc.eyes] closed, and maybe you’ll just go.");

output("\n\n{if pc is biped:");
output("\n\nWith an irritated grunt you cross your arms, flat out refusing to get out of the comfy bed as you roll onto your back. As you lay there stubbornly trying to will yourself asleep your mind wanders and you fondly begin to remember some of your recent, adult-oriented activities with a grin.");

output("\n\nJust at the memory of your [pc.pussy] being filled you begin to gush a bit beneath the covers. That is when you realize, for the first time, that you’re as naked as the day you were born. Funny... you can’t seem to remember whether you went to sleep nude or not, but you shrug it off because apparently you did.");

output("\n\nAll in all it isn’t hard to figure out that the reason you suddenly can’t sleep is because you’re way hornier than you initially thought you were. If the puddle of wetness spreading around your [pc.ass] is any indication you desperately need to pleasure yourself. As the thought occurs to you your mind fills with thoughts of skilled tongues and hard cocks, thoughts that are so strong you can practically feel a tongue caressing your sensitive feminine opening.");

output("\n\nWith a soft moan you reach down to rub your [pc.clit] only to connect with something gooey and round.");

output("\n\nWith a yelp you throw off the covers and attempt to scramble away from whatever the fuck that is. Its strong arms hook around your [pc.legs], holding them open as the mouth gently licking your [pc.pussy] stops with the romantic foreplay and begins to really go to town. You watch as more of the creature’s body spills out of your vagina, realizing with horror that it is forming from all of the cum that has been deposited inside of you. The creature grows until it is just a head, humanoid torso and arms. Its lower half is just a blob, as if it doesn’t need to form legs, like some kind of slime monster made out of cum.");

output("\n\nYour disbelieving [pc.eyes] watch as the the creature’s head distorts, before it violently slams its face into your groin. You gasp as something phallic forms deep inside of you, combining with the rest of the creature. Yet even with that dick stretching your [pc.vagina] it never stops licking.");

output("\n\nThe cum creature must no longer feel the need to restrain you as you open your [pc.legs] wider to let it in. The androgynous half-formed blob simultaneously licks your most tender folds while fucking them with its face cock. Every thrust and lick combines into a masterful cacophony of sensation that burns out every other sensation. You watch as the cum monster begins to head bang, as if it were listening to some demented carnal song, which may very well be your voice from the way you scream and squeal at the odd but satisfying sensation of combined cunilingus and penetration.");

output("\n\nTears are flowing down your [pc.face] as the pleasure becomes more and more intense. You can’t breathe and you’re suddenly cumming. Your mind tries to make sense of the never ending orgasm but all you can do is convulse. Sensations like a lovely fire flows through you as you desperately claw at the cum monster’s head, yet you’re not sure if you’re trying to push the dick tongued androgynous creature deeper or pull it off. Soon you’re just screaming, [pc.legs] forming a wide V as [pc.girlcum] continuously flows out of you like a burst dam.");

output("\n\n/if pc is naga:");
output("\n\nWith an irritated grunt you cross your arms and refuse to get out of the comfy bed, despite having rolled onto your back. As you sit there stubbornly trying to will yourself asleep your mind wanders and you begin to fondly remember the more adult-oriented activities you’ve been getting into lately.");

output("\n\nJust at the thought of your [pc.pussy] being filled you begin to gush a bit beneath the covers, your [pc.leg] getting wet as you spill what you assume to be [pc.girlCum] all over it beneath the covers. Funnily enough you can’t seem to remember if you went to sleep naked or not but something feels a little... off.");

output("\n\nWith a shrug you figure the reason you can’t get to sleep is because you’re a lot hornier than you thought you were. The puddle of wetness is sliding down your sides, practically encasing you. That is when you feel yourself being lifted and pulled, as if the lady juices were, instead, a pair of arms.");

output("\n\nWait... that’s not right.");

output("\n\nThrowing the covers off you almost scream when you see some sort of gooey cum creature flowing from your vaginal opening like a torrent. The thing wraps its androgynous, aberrant self around your lower half, shifting into a torso and head with four pairs of arms.");

output("\n\nThat head forms right on top of your [pc.pussy] and instantly begins to lick and suck your sensitive vaginal walls, arms lifting and pulling your [pc.legs] to get a better angle. As it does you can’t help but think about how that damn thing is really good at this, it’s tongue and lips making your heart flutter.");

output("\n\n and damn that thing has latched onto you tightly as it makes your heart flutter with some of the best oral you’ve ever had.");

output("\n\nAs if to prove itself to you the creature lifts its head, a cock forming smack dab in the middle of its featureless face, and then slams that face cock first into you.");

output("\n\nThe simultaneous sensations of expert cunnilingus and being pounded by a perfectly sized shaft sends you into rapid convulsions. You can’t help but scream to the stars as [pc.girlCum] gushes from you like you’ve become some waterfall of carnality. The sensations are almost too intense and you feel yourself clawing at the creature’s head, which only distorts under your fingers but never lets up its near violent assault on your nether region. You’re also not quite sure if you’re trying to pull the thing off or push it in deeper. Soon you’re just howling like a madman, your [pc.leg] pushing your [pc.ass] off the bed’s surface as you cum again and again from the oral machinations of this monster made of semen.");

output("\n\n/if pc is taur:");
output("\n\nWith an irritated grunt you cross your arms and refuse to get out of the comfy bed, instead rolling your body so that you may stretch each leg one by one. Then you lay your head on your crossed arms, stubbornly trying to will yourself asleep. Instead of drifting off your mind wanders, finding its way to your recent adult-oriented activities and causing you to smile to yourself.");

output("\n\nJust at the memory of your [pc.pussy] being filled you begin to gush a bit beneath the covers. Funnily enough you can’t seem to remember if you went to sleep naked or not but that is neither here nor there. You figure the reason you can’t get any sleep is that you’re a lot hornier than you thought you were. If the cascade of wetness trailing down your [pc.legs] is any indication you desperately need to masturbate. Unbidden thoughts of cunnilingus and intercourse are so strong in your mind’s eye you can practically feel a gooey tongue and lips licking and kissing your vaginal lips with an almost sacred reverence.");

output("\n\nSlowly you begin to realize that that sensation isn’t in your head at all. Something is down there actually licking your pussy and doing a damn good job.");

output("\n\nWhipping the blanket off you twist around only to see some androgynous, gooey face look up for a second, it’s featureless face realizing the jig is up. Before you can even react it is shoving its face back into your [pc.vagina]. Where before it was gently savoring each lick, now it is greedily devouring your feminine folds in a way that makes it hard to concentrate. You attempt to roll yourself onto your wobbly legs only to find your [pc.knees] weak.");

output("\n\nTendrils of jizz shoot out from that cum blob in an attempt to keep it secured onto you, its tongue making you moan, gasp and curse. As your pussy is greedily eaten you make the cognitive leap required to realize just where this creature had to come from, your [pc.pussy] itself. Somehow it must have formed from the remnants of all the cum you had in there. Now like some pleasure parasite it is attempting to make you cum even more.");

output("\n\nThe tendrils lock your [pc.legs] together, rooting you on the spot. You begin to feel something phallic growing inside of you, spreading your feminine folds as wide as it can and, yet, you’re still being licked.");

output("\n\nThe creature goes the fuck off. It hammers your pussy with its cock tongue and forces you to scream as you reach climax. The moment you begin to cum you don’t stop, agonized pleasure made to last an eternity by the creature’s carnal machinations. You thrash and howl until your voice goes hoarse.");
output("\n\n}");

output("\n\nYour [pc.eyes] suddenly snap open. Whoa that dream was intense and you chuckle in response to dreaming such things. You wipe your [pc.face] only to feel something wet clinging to your fingers. Looking down you see your hand is covered in the very same cum from your dream.");
output("\n\n}");

*/