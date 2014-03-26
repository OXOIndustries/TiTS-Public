/*CHARACTER LIMITATIONS:

Sellesy has no preference of gender, in fact, she’ll sleep with just about anyone she wants to. Or anyone who looks like theyve got money. Much like losing a fight in CoC, she would be likely to take money from an unconscious partner after an encounter. Sex with her really is like losing a fight, not that people tend to complain. Her entire character is about loving sex, and the benefits that it provides, both figuratively and literally. 

Her milk is mildly addictive, it keeps you coming back for more. A seedy business practice indeed! She absorbs the fluids and nutrients from other races, leaving them a little drained after sex with her, and in turn, uses that to produce milk, which gets more people to fuck her in a nice cycle. 

She will fuck most male characters, but each character is limited to certain interactions. For example, if a character’s cock is 24” plus, she’ll just plug their cockhead against her pussy, and give ‘em a footjob. They wouldn’t fit, but she’s still happy to milk them dry. 

Due to her nature, she’s only sexually interested in males, but will happily sit down to nurse a sexy girl at the bar :3

Her legs are her main bodily attribute. She uses them to constrict, to control, to entwine, to embrace. A very “leggy” character in summary, with a rather predatory nature. She is more than happy to keep a character trapped between her legs, even if they’re ready to stop fucking, and once again, milk them dry. 

Character interaction basically goes: when you first meet her, she tricks you into having a drink. The entire bar is basically designed to ensnare people, then keep them coming back once they’re hooked. A little dark, perhaps, but more than made up for by how “friendly” the service can be. 


ORDER OF SCENE

First occurence
1a. 	“First time at the bar”
	Choice - Get a drink, leave
2a. 	“First Drink” 
3a. 	“After Drinking”
	Choice - Go upstairs, leave
4a. 	Sex Scenes

Repeating occurence

1b. 	“Returning to the Bar”
	Choice - Get a drink, go upstairs, leave
2b. 	“Having a drink” 
3a. 	“After Drinking”
	Choice - Go upstairs, leave
4a. 	Sex Scenes
*/



function anonsBarWaitressAddendum():void {
	if(flags["SEEN_SELLESY"] == undefined)
	{
		flags["SEEN_SELLESY"] = 1;
		output("\n\nAs you enter the Bar, leaving the check-in kiosk behind, a wall of heady aromas assault your senses. The clouds of thick, scented incense make it difficult to see around the room clearly from the hanging clouds that partially obscure several tables. Strong alcoholic scents mix with the smoke, and your eyes cringe slightly as they adjust. Peering into the dimly lit bar-cum-reception area, at least four of the three-legged waitresses are tending to the patrons with seats.");
		output("\n\nEach waitress dresses more suggestively than the next. One with pale blue skin wears a ‘schoolgirl’ costume which barely covers her nipples, the trio bulging from the fabric. Another of her kind whose skin has a deep green hue wears a skintight sheer shirt and little else, and by contrast the other waitress looks fully clothed.");

		output("\n\nAs you approach a seat at the bar, you notice that the seat resembles a little colored plastic pad. However, the seat apparently senses your intention and rearranges itself into a shape more suitable for a human occupant. You notice that the other patrons also have similar chairs to occupy, or in the case of one particularly tentacled individual, more of a bathtub.");

		output("\n\nBefore you can truly contemplate the nature of this adaptive seating, one of the waitresses notices you. Turning, your eyes roam across her impressive figure. Her legs are thick, powerful, yet sleek, and undeniably full... however, more prominently in your mind – not to mention your view – are her three massive tits.");
		output("\n\nYou could wave her over if you wanted.");
	}
	else {
		output("\n\nThe three breasted waitress");
		if(flags["MET_SELLESY"] != undefined) output(", Sellesy,");
		output(" is here again, though she hasn't yet caught sight of you. You could flag her down if you wanted.");
	}
	addButton(0,"Waitress",anonsBarWaitressApproach);
}


function anonsBarWaitressApproach():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	////1A. “First time at the bar”
	if(flags["MET_SELLESY"] == undefined)
	{
		flags["MET_SELLESY"] = 1;
		output("You nod to the many-breasted waitress, and as she approaches, your eyes cannot help but widen at the sight of her bust.");
		output("\n\nHer breasts would look massive on a human woman, each at least an EE-cup, yet they are only moderately oversized for her tall, wide frame. You subconsciously wonder if that third leg is exactly there to support that incredible additional weight.");

		output("\n\nYou find her standing too close to you for a ‘professional distance,’ with an imperceptible sheen of sweat coating her voluptuous curves that causes her pale red skin to practically glow in the dim lighting. Her skintight white shirt reveals a hint of the red flesh beneath, and a mixed hue of coloured stains across her top. It’s hard to keep a uniform clean in a busy bar, though you wonder if those stains are from more than just spilled drinks....");

		output("\n\n<i>\"Go ahead and stare all you want sweetie, but can I get you anything to drink while you do?</i>\"  she asks with a knowing grin that shakes you from your stupor. \"<i>My name is Sellesy, and I'll be taking care of you all night...</i>\" she continues, adding a sultry tone to the end, which you could easily have missed, hard as it is to look up from the incredible bust sitting directly in the center of your vision. \"<i>We have quite a few delicious drinks 'on tap' tonight!</i>\"  she notes, seemingly not minding your fascination, and giggles away to herself, amused by her own joke.");
		//[CHOICE: ORDER A DRINK / LEAVE]
		clearMenu();
		addButton(0,"OrderDrink",firstDrinkFromSellesy);
		addButton(14,"Leave",mainGameMenu);
	}
	//************************
	//1B. “Returning to the Bar”
	else
	{
		output("Sellesy immediately spots you as you wave for her, and her face visibly brightens at the prospect of having you as a customer again.");
		output("\n\nAs you take a seat, she saunters over on her now familiar lithe, toned legs. She places a hand very suggestively on your shoulder, toying with your neck with one finger as she greets you.");
		output("\n\n“<i>Welcome back baby. I knew you couldn’t stay away for long. Are you feeling THIRSTY? Or were you hoping to skip straight to the ‘deposit’ this time?</i>”  she asks with a knowing grin.");
		//[CHOICE: ORDER A DRINK / LEAVE]
		clearMenu();
		addButton(0,"OrderDrink",firstDrinkFromSellesy,false);
		addButton(14,"Leave",mainGameMenu);
	}
	
}

//*********************************
//1B. “First Drink”
function firstDrinkFromSellesy(first:Boolean = true):void {
	author("Mr. Writer");
	userInterface.showName("\nSELLESY");
	if(first)
	{
		clearOutput();
		output("\"<i>Okay! I'll be right back sweetie, and do feel free to stare... looking is free after all,</i>\" she adds with a suggestive wink. Perhaps that means there's more than just drinks on the menu here....");
		output("\n\nFollowing her with your gaze as you watch her leave on her way to the bar, you notice the swell of her two outer massive breasts from behind, jiggling with each step. It is an almost hypnotic view even from this angle. She is comparatively adept at moving on all three legs. Her supple butt-cheeks are round and pronounce exaggeratedly from beneath the excessively short skirt she wears, and with amusement you realise that she must have three bountiful, bouncing buttocks.");
		output("\n\nYou laugh inwardly at your lame rhyme, but the heavy incense in the air makes it difficult to think clearly. Besides, from what you've seen, and from the nature of this bar, you doubt you’ll have to spend much time thinking. You shake yourself back to awareness once more, realizing that the beautiful women and heady aromas can cause you to easily slip into a daze.");
		output("\n\nAs her moving body keeps you from dozing off, something catches your attention. Your waitress and a few others are behind the bar, fixing drinks, and yet the bar lacks bottles, or glasses for that matter. Most bars you've been to usually rack them up on the shelves. In fact, now that you look around, you realise that nobody in the bar holds a glass... and instead, those who are drinking seem to be sitting very close to the waitresses indeed.");
	}
	output("\n\nA soft, plush, yet firm touch presses against your cheek, bringing your attention to your front. You try to slide back in your chair, but the solid plastic holds you firm now. Sellesy’s massive bust is inches from your face, and her arms hug you into her yielding softness. She presses her hands into your shoulders and pushes you against the back of the chair as she slips her forward two legs delicately around your thighs. Gripping you, she locks her legs together and pins you to the chair.");
	output("\n\nFrom up close, her breasts appear, if anything, larger than before. They seem swollen even, almost as if she went to the bar just to have them....");
	output("\n\nNow, creamy stains spread across her shirt. The way the three very prominent nipples begin to tent out her now steadily soaking shirt, shows you just how these girls serve their drinks. Soon, the white material grows steadily transparent, until all the decency of her covered breasts disappears.");
	output("\n\n\"<i>Well, honey, do be brave,</i>\"  she says in a low, sultry voice. Using her arms, now freed from needing to hold you down, Sellesy lifts the top past her neck.");
	output("\n\nEach breast is of a size even more incredible than you dare to imagine, and center among the three-inch wide, drink-filled, puffy areola, engorges a dark, blood-red nipple large enough to jut out at least an inch from the breasts. They resemble three, dark red thumbs more than nipples. The skin on the swell of her breast has a slick-wet healthy sheen, suggesting that the sweat is from working at the bar, or something else....");
	output("\n\nShe grins as her hand snakes its way to your neck and begins to gently spread the fingers in a relaxing way. She delicately strokes, caresses, and works the back of your head, as the other begins to work on relaxing your shoulders. It's impossible to feel any tension as the massage causes your eyelids to droop, and your body to sink ever so slightly into the inescapable chair.");
	output("\n\nShe leans in close, resting her chin gently on your shoulder. \"<i>Drink up, sweetie...</i>\"");
	output("\n\nShe sits back and lifts her titanic middle breast, and begins to tickle and tease the very prominent nipple back and forth across your lips. Reluctant from her forcing you into such a sexual situation, and yet unable to deny the overwhelmingly eroticness of her touch, your body responds to your primal instincts, and you feel your pursed lips involuntarily loosen, and begin to press and probe, seeking out her milk.");
	output("\n\nAs soon as her nipples loosen enough, a small spurt of milk manages to worm its way inside your mouth. Her hands grasp you roughly and pulls you into her bountiful middle breast face-first. The breast-flesh smothers you instantly. You try to inhale through your nose in shock, but a wall of soft, yet unrelenting womanly skin prevents this. Unable to breathe, your body widens its mouth for air, and only then do you realise you have fallen same trick she uses on all her customers.");
	output("\n\nA thick, one-inch nipple forces its way into your mouth. A deluge of sweet, cottony drink begins to pool into your throat. Still unwilling to give up so easily, you squirm and struggle between her hugging arms and crushing bosom, but find yourself unable to do more than jiggle her titanic tits, much to her amusement.");
	output("\n\nYou are helpless to do anything but swallow the quickly growing mouthful of overly sweet, yet unmistakably alcohol-laced drink, unless you want to drown in a sea of tit-flesh. Immediately, you are overcome by a sense of heightened sensitivity to touch, and smell, as the cottony substance tingles all the way down to your stomach, and you feel your mind fogging over.");
	output("\n\n\"<i>Aaaahhh...</i>\"  she sighs in utter satisfaction, as massive swollen breasts are just beginning to relieve the pressure of so much additional volume. You feel her hands return to their relaxing, gentle stroking, just as her breasts roll back just enough to let you breathe. \"<i>That's it... gooooood" + pc.mfn(" boy"," girl","") + "...</i>\"");

	output("\n\nYour suffocation on her her immense bosom subsides quickly and your lungs refill. Her long, thick nipple causes rather embarrassing wet sucking and slurping noises as it gently slips in and out of your lips. Her hands, her fingers, play magic across your shoulders, along your neck, even along your ears. She looks to be quite enjoying herself too, judging from the way her crotch gyrates its way gently against yours in rhythm with your suckling, and the gentle mouth fondling her hardened nipple. Even the soft, grained feeling of her elongated nipple against your lips is eliciting almost unknown pleasures from within you, and inevitably, you slip back into that delightfully relaxing daze of before.");

	output("\n\nYou are now happily suckling away at her massive tit, echoing the actions of the patrons scattered throughout the bar. You manage to look through lidded eyes at the closest patron to you, lying back on a bed-like chair, as her waitress lowers one massive breast over her face, and sighs in relief as her free hands roam the helpless girl's body, much to the girl's obvious delight. As you watch, she curls into an almost infantile pose, before a swell of Sellesy's breast looms in and blocks your view.");
	output("\n\nLooking up you see her staring down at you, all three eyes positively alight with glee. \"<i>How's that sweetie? Taste good?</i>\"  she asks rather girlishly, apparently already certain of the answer, \"<i>I get lots of compliments on my drink mixing. I always make something my customers swear they could just drink forever...</i>\"  she utters softly, shuddering slightly from the unbidden gentle nibbling of her nipple.");

	processTime(5+rand(5));
	//[The following scenes are effective no matter character type, size/stature. It is assumed Sellesy and the chair adjust for any difference in height, or in the case of being awkwardly largely endowed, she just straddles their cock with a wider berth between her legs.]
	clearMenu();
	if(pc.hasCock()) addButton(0,"Next",firstTimeWithSellesyForCocks);
	else if(pc.hasVagina()) addButton(0,"Next",firstTimeWithSellesyForVagoos);
	else genderlessEpilogueForSellesy();
}

function genderlessEpilogueForSellesy():void {
	output("\n\nSellesy openly presses against your groin and then frowns, obviously disappointed with what she finds there. Before you have a moment to react, she spins away with a murmured \"thank you.\"");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[FOR MALES/HERMS] [See parentheses for editions which must be made based on character]
function firstTimeWithSellesyForCocks():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	output("The gyration of her hips increase in intensity. A series of delicate little moans escapes her, biting her lip in ecstasy. [pc.EachCock], already hardened by the experience thus far, responds naturally.");
	//For massive cocks, 24” plus: 
	if(pc.shortestCockLength() < 24) 
	{
		output(" Your massive cock, already hardened by the experience thus far");
		if(pc.isCrotchGarbed()) output(", begins to stretch your " + pc.lowerGarment() + " to the limit.");
		else output(", begins to stretch to its full, erect size.")
	}
	output(" A wet, slick feeling is growing at your stomach, as your pre-cum is rhythmically squeezed from your cock, one drip at a time. You give her ample area to grind against.");

	output("\n\nThe intense heat, damp around your crotch, tells you she's close. You exhale in shock as her legs clamp even tighter around you, and her pussy begins to frantically rub against your hardened length, trapped between your stomach and her hungry core. The orgasm within you builds steadily, and as this incredibly sensual moment peaks, you cum uncontrollably, trapped in the vice-grip of three orgasmically-clenched thighs.");
	output("\n\nShe cries out breathlessly, throwing her arms around your back and holding you close as her entire body seizes up and you feel your own climax shiver through your trapped body. As her pussy clenches and drips hungrily against your cock in the throes of orgasmic bliss, you can only imagine what it would be like to be inside her.");
	processTime(5+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sellesyPostDrinkEpilogue);
}
//[FOR FEMALES]
function firstTimeWithSellesyForVagoos():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	output("The gyration of her hips increases in intensity. A series of delicate little moans escape her, making her bite her lip in ecstasy. Your own pussy, hot and moist, experiences the simmering, wet feeling of her as she grinds your crotch. You can tell she's close, but can only exhale in shock as her legs clamp even tighter around you, and her pussy begins to frantically rub against your moistening slit. Your own orgasm builds steadily, as this incredibly sensual you cum uncontrollably as she traps you in the vice-grip of three orgasmically-clenched thighs.");
	output("\n\nShe cries out breathlessly, throwing her arms around your back and squeezes you close as her entire body seizes up, and you feel your own climax shiver through your trapped body, her pussy clenching hungrily against yours. With your scant clothing separating the two, it feels wonderfully erotic.");
	processTime(5+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sellesyPostDrinkEpilogue);
}

//**************************
//2B. “Having a drink”
function repeatDrinkyDrink():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	output("As Sellesy casually strolls off to ‘prepare’ your drink, you take the opportunity to have a more in-depth look around the bar. There’s a wide variety of patrons, from what you can see through the incense, although many of them are seedy folk in nature. Given the nature of the bar, it’s unsurprising.");
	//[Then continue the “First Drink” scene from the line: A soft, plush, yet firm touch presses against your cheek, bringing your attention to your front.]
	firstDrinkFromSellesy(false);
}

//*********
//“After Drinking”
function sellesyPostDrinkEpilogue():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	processTime(15+rand(10));
	output("You awaken a short while later, held amidst her tender arms as she holds you close to her bountiful bosom in the chair, which has grown to accommodate you both. Your stomach feels a little bloated, no doubt from draining her colossal tit, and yet now you look to her remaining, untouched pair.... They seem positively swollen!");
	output("\n\n\"<i>I hope you enjoyed your drink,</i>\"  she whispers in your ear, her lips pressing against it as though she's kissing your mind itself. \"<i>I hope you'll come back soon, but of course... there's no need to run off just yet, is there? After all, you've still got two more ‘drinks’ left...</i>\" she adds with a bemused chuckle.");
	output("\n\nA drip of sweat crests her head-spinning cleavage, but she seems undaunted by the prospect of another round, in fact you think it must be almost uncomfortable to have her tits so full. So very... very full....");
	if(pc.hasCock())
	{
		output("\n\nThe thought of nursing from her again makes your stomach groan with hunger. It’s impossible, though, for you to ignore how your time with her has left you feeling (exactly how long you’ve been here rather unknown to you, the lack of any natural light or clocks an eerie reminder of your isolation in this establishment). You feel extremely warm and oh so relaxed in her arms, feeling overall refreshed and yet... content.");
		output("\n\nWould it really be so bad to stay here with her a while longer?");
		//[Options: Leave, go upstairs to her "private room"]
		clearMenu();
		addButton(0,"Stay With",stayWithSellesy);
		addButton(14,"Leave",mainGameMenu);
	}
	else {
		output("\n\nThe thought of nursing from her again makes your overfull stomach roll, and you politely decline, sending the well-drained waitress on her way with a smile.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

function stayWithSellesy():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	output("Sellesy leads you up to her lavish, if modestly sized apartment above the bar, and she sits back contentedly on her large bed. She obviously earns enough to live very comfortably.");
	output("\n\n\"<i>Hmmm... I guess you've got a bit of energy you want to put to use huh? Not to worry... I'll help you burn that off.</i>\"  she quips with a smirk.");
	output("\n\n<i>\"What did the " + pc.mfn("strapping lad","delicious looking girl","gorgeous creature") + " standing before me have in mind?\"</i>");

	//[Options: Titjob (males/herms), Blowjob (males/herms), Vaginal (male/herms), Scissoring with clitentacle penetration (herms/females), 69 (males/herms/females)
	//[TITJOB - For Males/Herms any size cock]
	clearMenu();
	if(pc.hasCock())
	{
		addButton(0,"Titjob",titJobFromSellesy);
		//[TRIPLE FOOTJOB - For Males/Herms with BIG dicks, too big for her maximum of 24" length, 3"wide.] 
		if(pc.biggestCockLength() >= 24) addButton(1,"Footjob",tripleFootjob);
		else addDisabledButton(1,"Tri-Footjob");
	}
	else {
		addDisabledButton(0,"Titjob");
		addDisabledButton(1,"Tri-Footjob");
	}
}

//[TITJOB - For Males/Herms any size cock]
function titJobFromSellesy():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	var x:int = pc.biggestCockIndex();
	output("Pulling you gently onto the bed, once in the embrace of her arms, you feel the rather snake-like sensation of her three legs beginning to embrace you once more. One leg worms its way ");
	if(pc.legCount == 1) output("around your [pc.leg]");
	else output("between your [pc.legs]");
	output(", it's reverse position on her anatomy allowing her foot to gently massage your cock momentarily on it's way past. Her other two legs contract around your midsection, her calves crossed across your lower back, as she slides you up along her stomach.");
	output("\n\nThe tits that still boggle your mind even now lay perky as ever, standing in a row like soldiers on parade. As she slides you forward, with her free hands, she begins to massage her nipples. Once fully erect, you swear they're practically throbbing as blood flows through them, and a steady trickle of her cream begins to drip every which way down them, funnelling into the canals of either cleavage. So flush are they against each other, so tightly pressed together by their sheer perkiness, that small pools of creamy liquid have formed where breast meets chest.");
	output("\n\nWith a finger, she dips into one of them, and sucks longingly. As her tongue swirls around it, obviously enjoying her own taste as much as you do, you feel your cock hardening against her abdomen in response to the lascivious display. She begins to dip her fingers deeper and deeper into her cleavage, licking away at the excess cream each time, and you realise she's lubricating her tits with her own lactation.");
	output("\n\nAs this dawns on you, you feel those powerful legs squeeze a little, and slide you further up her body, slightly aided by the now milky-slickness the constant dribbling of her tits has provided. She cranes her neck to see over her own bust, and guides you to her left cleavage. The feeling of your [pc.cockHead " + x + "] against the soft globes of her under-boob is something you promise yourself you will never forget. A slightly warm trickle passes ");
	if(pc.balls > 0) output("under your [pc.balls]");
	else output("across your taint");
	output(", and you panickedly wonder if just the thought of those tits around your [pc.cock " + x + "] might have caused you a little too much excitement. However, you see her with some noticeable effort pulling her tits apart, creating just enough relief to allow her cream to drip through the insane chasm that is her cleavage.");
	output("\n\nLoosening just enough to allow the slick substance to lubricate between her tits, and drip along your cock in the process, with one last tug of her legs, you feel your [pc.cock " + x + "] slide home. Truly, there's no better way to put it, as you truly feels at home here more than anywhere else, ever before.");
	//[If their cock is more than 24" Long]
	if(pc.cocks[x].cLength() >= 24)
	{
		output("\n\nAs you feel your entire length slide through the soft, warm cocoon, you feel the tip of your cock poke out into an almost cool pool of liquid. You can't see past her tits anymore, barely able to see her face above them, but you know you must have bottomed out, and poked through to the other side of her impossible cleavage.");
		output("\n\n<i>\"Oooh... something for me to play with up here!\"</i>  she remarks excitedly, and you feel a warm, wet, slippery thing begin to lick and caress across your [pc.cockHead " + x + "].");
		output("\n\nShe giggles and groans delightedly as she gets to lick and suck on your cream-flavoured cockhead whenever it pokes through.");
	}
	output("\n\nShe begins to slowly clench and relax her legs. Just that effort alone is enough to push your [pc.cock " + x + "] in and out of their new found home, causing you to gasp in sheer delight. When she starts pushing your ass in with her third foot, however, it truly makes your mind spin. Closing your eyes, it's hard for you to conjecture at what's going on, but your thoughts decides that all that matters is how perfect the softest, warmest, slipperiest pillows are while you're fucking them. Your pleasure-slackened jaw grins ever so slightly as you realise that's not too far from the truth, and your body begins to naturally start fucking the delightful pillows.");
	output("\n\nHer foot, previously using your ass as leverage, now leaves you to rut, captive between her legs. Instead, you feel her toes begin to tickle against your ass cheeks. An arm reaches out from the side of her tits, followed by another from the opposite side. Immediately, you feel her tits begin to squish together, and your breath catches in your throat. As her hands grasp your cheeks, you feel her tits press together tighter and tighter, and small rivers of cream stream from her nipples as her swollen tits collide. Leaving you breathless, she pulls you in for a kiss. Your chin rests against the swell of her middle bosom, as she stretches her head over to kiss you. Her hard, prominent nipples poke into your chest, and leave wet spots wherever you rest.");

	output("\n\nMeanwhile, a single toe worms its way between your ass-cheeks and suddenly tickles against your [pc.asshole]. Eliciting a gasp from you, you try to break from the kiss in shock, but she merely wraps her arms around your shoulders and pulls you back in harder. With one deft plunge, her toe pushes into your ass and stretches ever so gently at your sphincter.");
	output("\n\nHer toe begins to wiggle back in forth, resulting in a very odd sensation. As you are manipulated so as to keep fucking her tits, however, it's hard to ignore how quickly that odd sensation is becoming a pleasurable one.");
	output("\n\nFor some time, you lay there, trapped between her arms, legs, tongue, lips, tits, and mischievous toes. At last, however, she removes her toe, and your sphincter clenches in what you find hard to deny as longing. Pulling back slightly, you stare mildly questioningly, before you feel her arms at work, and feel an almost alien sensation of something solid against your cock, having spent the last who knows how long knowing only the sheer softness of her breasts.");
	output("\n\nOnly when you feel a temporary breath of cool air against your [pc.cock " + x + "] do you realise she's simply swapping you to her other cleavage. The subtle difference between one pair of tits and the other is one that only a true connoisseur could appreciate, and you want to spend as much time as you can becoming one.");
	output("\n\nWhat seems like hours later, you are still locked in her cushiony, leggy embrace. Perhaps it has been hours, or maybe only minutes. Time almost has no meaning as long as your cock is between those tits. Her toe, now back inside you, feels so natural in your ass now that it leaves a warm, tingling sensation throughout your lower body with every little twitch.");
	output("\n\nHowever, nothing can last forever, and as they say all good things come to an end. With a noticable and audible change in tempo, you feel her start to truly vigorously pump your entire body against her, with all the pleasure in the universe centred on your cock as far as you’re concerned. Inevitably, you can’t hold out long against this kind of treatment, and with a searing warmth your [pc.cockHead " + x + "] tingles, twitches, and spurts a thick rope of [pc.cum] between her bosoms.");
	output("\n\nShe pulls you in tight, holding you against her oh-so tight, and pressing her tits into your [pc.fullChest] so tightly that the feeling of her long, hard nippled digging into you is almost painful. With a shuddering gasp, you feel her excited breath in your ear as she empathetically drips a load of cream down your chest.");
	output("\n\nEntirely buried between her tits, you see no evidence of your orgasm until several body wracking twitches later.");
	if(pc.cumQ() < 10) output(" A single [pc.cumColor] droplet lands atop her heaving bosom.");
	else if(pc.cumQ() <= 25) output(" A few [pc.cumColor] strands splatter across the curvature of her heaving bosom.");
	else if(pc.cumQ() <= 100) output(" More than a few [pc.cumColor] strands arc up and fall upon her heaving bosom.");
	else 
	{
		output(" You see a hint of your impressive load bubbling up between her tits, mixing with the milk that has pooled there into a small lake."); 
		if(pc.cumQ() >= 700) output(" Not long after, streamers of [pc.cumColor] pour out of the over-filled cleavage to splatter overtop of you.");
		if(pc.cumQ() >= 2000) output(" You shoot until her tits and neck become utterly glazed and the streamers have transformed into waterfalls.");
	}

	output("\n\n<i>“Ooh!”</i>  she squeals softly in utter delight. <i>“Is this for me? I DO love a good ‘cock’tail!”</i>  she quips, before immediately slurping away at the mixed liquids with her rather long tongue. You might almost feel the need to chastise her for her terrible puns if not for the mind-numbing orgasm still blowing through your body and the utterly erotic sight of her tongue dancing amidst the post-coital fluids on her bountiful breasts.");
	output("\n\nWith a look in your dazed eyes, she smiles knowingly and pulls you closer to her breast, rolling you to one side and holding you in the midst of one of the best come-downs of your life. You feel very fuzzy-headed and almost overwhelmingly relaxed, your head now resting against her warm, still slightly slick breasts, and your mind filled with the sounds of her gentle breathing.  You very easily drift to sleep in her caring arms.");
	//[Wake up fully clothed downstairs in the bar, in a chair, missing a bit of money :3]
	if(pc.credits >= 50) pc.credits -= 50;
	processTime(20+rand(40));
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//
//[TRIPLE FOOTJOB - For Males/Herms with BIG dicks, too big for her maximum of 24" length, 3"wide.] 
function tripleFootjob():void {
	clearOutput();
	userInterface.showName("\nSELLESY");
	author("Mr. Writer");
	output("Dropping your [pc.gear], you can see she is immediately astounded by what she sees. She paws closer from her position on the bed, and reaches out almost in awe. As she gently massages [pc.oneCock], and measures it against her forearm, her eyes widen ever so slightly in realization.");
	output("\n\n<i>\"I didn't realise you were so big... sorry honey, I just don't think it'll fit. Even our kind have limits,\"</i>  she says rather softly, sounding genuinely disappointed.");
	output("\n\nSuddenly, her eyes light up, and she motions towards her bed. Wondering just what she has in mind, you follow her curling finger as she lowers herself down to her sheets.");
	output("\n\nAs she wraps two of her legs around your centre, placing her feet on opposite buttcheeks and pulling you, and your dick, well within her reach.");

	output("\n\nWith your thighs flush against the edge of her bed, she stretches out, prostrating herself in front of you. Still unsure of what to expect, she delicately brings her feet to bare. Resting her three, soft, rather flat soles against and around your considerable length, it's now quite obvious what she has in mind, as she presses your [pc.cockHead " + x + "] against her now open, three-cornered pussy.");

	output("\n\nWith rather deft ease, she begins to massage your cock at a relaxed pace, not breaking rhythm even as your cock hardens and begins to push you away from her slightly. You have to admit, this does feel amazing. Watching her lay back and looking so relaxed, \"hands-free\" as it were, and the feeling of her three rather large yet soft feet all over your [pc.cockBiggest] has a charm in and of itself. Usually you would think a foot job might take a little more effort to get you off but with all three of her feet working in tandem, you find yourself very swiftly approaching your limit.");

	output("\n\nShe reaches down between her front most legs with one arm and vigorously plays with her exposed clit. With each moan, you feel her pussy clench against your cockhead like a hungry mouth. The image sticks in your mind and swiftly drives you closer and closer to what you can already tell will be a ");
	if(pc.balls > 0) output("ball-churning ");
	else output("prostate-emptying ");
	output("climax.");

	output("\n\nThe sound of her moans echoing past the titanic bosom, and engulfing legs, is almost musical. All at once a rough and primal sound, and yet delicate like the tinkle of glass. Everything about this woman is so entrancing, so fascinating, you hope this wont be the last time you see her... for several reasons.");
	output("\n\nWith a quickening of her breath, her feet increase their pace, sliding gracefully back and forth along your massive cock, now slick with a combination of lubrication. Her feet synchronize so they nearly meet edge to edge around your shaft and begin to slide in unison up and down, up and down... her ankles just barely cresting the your [pc.cockHead " + x + "], her toes tickling gently as they reach your groin.");

	output("\n\nFinally, the combination of this erotic, perverted entwinement proves too much, and you feel an all too familiar throb throughout your [pc.cockBiggest], which leaves a distinct tingle in your tip. Obviously feeling this, she merely groans with indulgence, her pussy hungrily mouthing against your cock.");
	output("\n\nSuddenly, you feel an awfully strange sensation, as you look down to see a small tendril entwining her fingers... and realise that she is no longer playing with her clit.  Instead her clit is playing with her.");
	output("\n\nThe two other clitori you now see slithering around and across your cock, providing a delectable sensation which merely adds to the sensation in your pleasure-addled mind.");
	output("\n\nAs much in unison as her feet are, you feel your climax and hers approaching quickly. All at once, her clitoris-tentalcles encircle your cock around the [pc.cockHead], just able to form a sort of “ring” just beneath it, and begin to writhe around, drawing an utterly gratified moan from deep within you.");

	output("\n\nYou feel your urethra parting within her as you shoot your first massive rope of [pc.cum] within her. Three feet clamp down and begin to milk your cock for all it’s worth as she pants and moans with the ecstasy of being filled and no doubt the feeling of her clitorises running across your cock so vigorously. She kneads at two of her nipples in utter delight, the debauchery having finally reached its limit, sending spurts of her cream dripping down her toned stomach.");
	output("\n\nWith a look in your dazed eyes, she smiles knowingly and pulls you close to her breast. Rolling you to one side, she holds you in the midst of one of the best come-downs of your life. You feel very fuzzy headed and almost overwhelmingly relaxed. Your head now resting against her warm, still slightly slick breasts, and your mind filled with the sounds of her gentle breathing, you very easily drift to sleep in her caring arms.");
	//[Wake up fully clothed downstairs in the bar, in a chair, missing a bit of money :3]
	if(pc.credits >= 50) pc.credits -= 50;
	processTime(20+rand(40));
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}