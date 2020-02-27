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


public function anonsBarWaitressAddendum(slot:int = 0):void {
	if(flags["SEEN_SELLESY"] == undefined)
	{
		flags["SEEN_SELLESY"] = 1;
		output("\n\nAs you enter the Bar, leaving the check-in kiosk behind, a wall of heady aromas assault your senses. The clouds of thick, scented incense make it difficult to see around the room clearly. Strong alcoholic scents mix with the smoke, and you cringe slightly as your eyes adjust. Peering into the dimly lit bar-cum-reception area, at least four of the three-legged waitresses are tending to the patrons with seats.");
		output("\n\nEach waitress dresses more suggestively than the next. One with pale blue skin wears a ‘schoolgirl’ costume which barely covers her nipples, the trio bulging from the fabric. Another of her kind whose skin has a deep green hue wears a skintight sheer shirt and little else, and by contrast the other waitress looks fully clothed.");

		output("\n\nAs you approach a seat at the bar, you notice that the seat resembles a little colored plastic pad. However, the seat apparently senses your intention and rearranges itself into a shape more suitable for a human occupant. You notice that the other patrons also have similar chairs to occupy, or in the case of one particularly tentacled individual, more of a bathtub.");

		output("\n\nBefore you can truly contemplate the nature of this adaptive seating, one of the waitresses notices you. Turning, your eyes roam across her impressive figure. Her legs are thick, powerful, yet sleek, and undeniably full... however, more prominently in your mind – not to mention your view – are her three massive tits.");
		output("\n\nYou could wave her over if you wanted.");
	}
	else {
		output("\n\nThe three breasted waitress");
		if(flags["MET_SELLESY"] != undefined) output(", Sellesy,");
		output(" is here again, though she hasn’t yet caught sight of you. You could flag her down if you wanted.");
	}
	if(flags["MET_SELLESY"] == undefined) addButton(0,"Waitress",anonsBarWaitressApproach,undefined,"Waitress","See if you can’t get the volutpuous trilateral’s attention.");
	else addButton(slot,"Sellesy",anonsBarWaitressApproach,undefined,"Sellesy","Get some bar service.");
}


public function getSellesyPregContainer():PregnancyPlaceholder
{
	var ppSellesy:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppSellesy.breastRows[0].breastRatingRaw = 10;
	ppSellesy.breastRows[0].breasts = 3;
	ppSellesy.milkType = GLOBAL.FLUID_TYPE_LEITHAN_MILK;
	ppSellesy.milkMultiplier = 100;
	ppSellesy.milkFullness = 100;
	
	if(!ppSellesy.hasVagina()) ppSellesy.createVagina();
	
	return ppSellesy;
}

public function showSellesy(nude:Boolean = false):void
{
	showBust(sellesyBustDisplay(nude));
	showName("\nSELLESY");
}
public function sellesyBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "SELLESY";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function anonsBarWaitressApproach():void {
	clearOutput();
	showSellesy();
	author("Mr. Writer");
	////1A. “First time at the bar”
	if(flags["MET_SELLESY"] == undefined)
	{
		flags["MET_SELLESY"] = 1;
		output("You nod to the many-breasted waitress, and as she approaches, your eyes cannot help but widen at the sight of her bust.");
		output("\n\nHer breasts would look massive on a human woman, each at least an EE-cup, yet they are only moderately oversized for her tall, wide frame. You subconsciously wonder if that third leg is exactly there to support that incredible additional weight.");

		output("\n\nYou find her standing too close to you for a ‘professional distance,’ with an imperceptible sheen of sweat coating her voluptuous curves that causes her pale red skin to practically glow in the dim lighting. Her skintight white shirt reveals a hint of the red flesh beneath, and a mixed hue of colored stains across her top. It’s hard to keep a uniform clean in a busy bar, though you wonder if those stains are from more than just spilled drinks....");

		output("\n\n<i>“Go ahead and stare all you want sweetie, but can I get you anything to drink while you do?”</i> she asks with a knowing grin that shakes you from your stupor. <i>“My name is Sellesy, and I’ll be taking care of you all night...”</i> she continues, adding a sultry tone to the end, which you could easily have missed, hard as it is to look up from the incredible bust sitting directly in the center of your vision. <i>“We have quite a few delicious drinks ‘on tap’ tonight!”</i> she notes, seemingly not minding your fascination, and giggles away to herself, amused by her own joke.");
		//[CHOICE: ORDER A DRINK / LEAVE]
		clearMenu();
		addButton(0,"OrderDrink", firstDrinkFromSellesy, true, "Order Drink", "Order a drink for 50 credits.");
		addButton(14, "Leave", mainGameMenu);
	}
	//************************
	//1B. “Returning to the Bar”
	else
	{
		output("Sellesy immediately spots you as you wave for her, and her face visibly brightens at the prospect of having you as a customer again.");
		output("\n\nAs you take a seat, she saunters over on her now familiar lithe, toned legs. She places a hand very suggestively on your shoulder, toying with your neck with one finger as she greets you.");
		output("\n\n<i>“Welcome back baby. I knew you couldn’t stay away for long. Are you feeling THIRSTY? Or were you hoping to skip straight to the ‘deposit’ this time?”</i> she asks with a knowing grin.");
		//[CHOICE: ORDER A DRINK / LEAVE]
		clearMenu();
		addButton(0, "OrderDrink", repeatDrinkyDrink, undefined, "Order Drink", "Order a drink for 50 credits.");
		addButton(14, "Leave", mainGameMenu);
	}
	if(pc.credits < 50) addDisabledButton(0, "OrderDrink", "Order Drink", "You don’t have the 50 credits to order a drink!");
}

//*********************************
//1B. “First Drink”
public function firstDrinkFromSellesy(first:Boolean = true):void {
	author("Mr. Writer");
	if(first)
	{
		clearOutput();
		showSellesy();
		output("<i>“Okay! I’ll be right back sweetie, and do feel free to stare... looking is free after all,”</i> she adds with a suggestive wink. Perhaps that means there’s more than just drinks on the menu here....");
		output("\n\nFollowing her with your gaze as you watch her leave on her way to the bar, you notice the swell of her two outer massive breasts from behind, jiggling with each step. It is an almost hypnotic view even from this angle. She is comparatively adept at moving on all three legs. Her supple butt-cheeks are round and show exaggeratedly from beneath the excessively short skirt she wears, and with amusement you realize that she must have three bountiful, bouncing buttocks.");
		output("\n\nYou laugh inwardly at your lame rhyme, but the heavy incense in the air makes it difficult to think clearly. Besides, from what you’ve seen, and from the nature of this bar, you doubt you’ll have to spend much time thinking. You shake yourself back to awareness once more, realizing that the beautiful women and heady aromas can cause you to easily slip into a daze.");
		output("\n\nAs her moving body keeps you from dozing off, something catches your attention. Your waitress and a few others are behind the bar, fixing drinks, and yet the bar lacks bottles, or glasses for that matter. Most bars you’ve been to usually rack them up on the shelves. In fact, now that you look around, you realize that nobody in the bar holds a glass... and instead, those who are drinking seem to be sitting very close to the waitresses indeed.");
	}
	output("\n\nA soft, plush, yet firm touch presses against your cheek, bringing your attention to your front. You try to slide back in your chair, but the solid plastic holds you firm now. Sellesy’s massive bust is inches from your face, and her arms hug you into her yielding softness. She presses her hands into your shoulders and pushes you against the back of the chair as she slips her forward two legs delicately around your thighs. Gripping you, she locks her legs together and pins you to the chair.");
	output("\n\nFrom up close, her breasts appear, if anything, larger than before. They seem swollen even, almost as if she went to the bar just to have them....");
	output("\n\nNow, creamy stains spread across her shirt. The way the three very prominent nipples begin to tent out her now steadily soaking shirt, shows you just how these girls serve their drinks. Soon, the white material grows steadily transparent, until all the decency of her covered breasts disappears.");
	output("\n\n<i>“Well, honey, do be brave,”</i> she says in a low, sultry voice. Using her arms, now freed from needing to hold you down, Sellesy lifts the top past her neck.");
	output("\n\nEach breast is of a size even more incredible than you dared imagine, and at the center of each three-inch wide, drink-filled, puffy areola, engorges a dark blood-red nipple large enough to jut out at least an inch from the breast. They resemble three dark red thumbs more than nipples. The skin on the swell of her breast has a slick-wet healthy sheen. Perhaps that sweat is from working at the bar... or something else.");
	output("\n\nShe grins as her hand snakes its way to your neck and begins to gently spread the fingers in a relaxing way. She delicately strokes, caresses, and works the back of your head, as the other begins to work on relaxing your shoulders. It’s impossible to feel any tension as the massage causes your eyelids to droop, and your body to sink ever so slightly into the inescapable chair.");
	output("\n\nShe leans in close, resting her chin gently on your shoulder. <i>“Drink up, sweetie...”</i>");
	output("\n\nShe sits back and lifts her titanic middle breast, and begins to tickle and tease the very prominent nipple back and forth across your lips. Reluctant from her forcing you into such a sexual situation, and yet unable to deny the overwhelming eroticism of her touch, your body responds to your primal instincts, and you feel your pursed lips involuntarily loosen, and begin to press and probe, seeking out her milk.");
	output("\n\nAs soon as her nipples loosen enough, a small spurt of milk manages to worm its way inside your mouth. Her hands grasp you roughly and pull you into her bountiful middle breast face-first. The breast-flesh smothers you instantly. You try to inhale through your nose in shock, but a wall of soft, yet unrelenting womanly skin prevents this. Unable to breathe, your body widens its mouth for air, and only then do you realize you have fallen for the same trick she uses on all her customers.");
	output("\n\nA thick, one-inch nipple forces its way into your mouth. A deluge of sweet, cottony drink begins to pool into your throat. Still unwilling to give up so easily, you squirm and struggle between her hugging arms and crushing bosom, but find yourself unable to do more than jiggle her titanic tits, much to her amusement.");
	output("\n\nYou are helpless to do anything but swallow the quickly growing mouthful of overly sweet, yet unmistakably alcohol-laced drink, unless you want to drown in a sea of tit-flesh. Immediately, you are overcome by a sense of heightened sensitivity to touch and smell, as the cottony substance tingles all the way down to your stomach, and you feel your mind fogging over.");
	output("\n\n<i>“Aaaahhh...”</i> she sighs in utter satisfaction as her massive, swollen breasts are just beginning to relieve the pressure of so much additional volume. You feel her hands return to their relaxing, gentle stroking as her breasts roll back just enough to let you breathe. <i>“That’s it... gooooood" + pc.mfn(" boy"," girl","") + "...”</i>");

	output("\n\nYour suffocation on her immense bosom subsides quickly and your lungs refill. Her long, thick nipple causes rather embarrassing wet sucking and slurping noises as it gently slips in and out of your lips. Her hands and fingers play magic across your shoulders, along your neck, even along your ears. She looks to be quite enjoying herself too, judging from the way her crotch gyrates its way gently against yours in rhythm with your suckling, and the gentle mouth fondling her hardened nipple. Even the soft, grained feeling of her elongated nipple against your lips is eliciting almost unknown pleasures from within you, and inevitably, you slip back into that delightfully relaxing daze of before.");

	output("\n\nYou are now happily suckling away at her massive tit, echoing the actions of the patrons scattered throughout the bar. You manage to look through lidded eyes at the closest patron to you, lying back on a bed-like chair, as her waitress lowers one massive breast over her face, and sighs in relief as her free hands roam the helpless girl’s body, much to the girl’s obvious delight. As you watch, she curls into an almost infantile pose, before a swell of Sellesy’s breast looms in and blocks your view.");
	output("\n\nLooking up you see her staring down at you, all three eyes positively alight with glee. <i>“How’s that sweetie? Taste good?”</i> she asks rather girlishly, apparently already certain of the answer, <i>“I get lots of compliments on my drink mixing. I always make something my customers swear they could just drink forever...”</i> she utters softly, shuddering slightly from your unbidden gentle nibbling on her nipple.");
	
	var ppSellesy:PregnancyPlaceholder = getSellesyPregContainer();
	pc.milkInMouth(ppSellesy);
	pc.imbibeAlcohol(50);
	processTime(5+rand(5));

	//Set and incerement amount of times drank from her.
	IncrementFlag("DRANK_FROM_SELLESY");

	//[The following scenes are effective no matter character type, size/stature. It is assumed Sellesy and the chair adjust for any difference in height, or in the case of being awkwardly largely endowed, she just straddles their cock with a wider berth between her legs.]
	clearMenu();
	if(pc.hasCock()) addButton(0,"Next",firstTimeWithSellesyForCocks);
	else if(pc.hasVagina()) addButton(0,"Next",firstTimeWithSellesyForVagoos);
	else genderlessEpilogueForSellesy();
}

public function genderlessEpilogueForSellesy():void {
	output("\n\nSellesy openly presses against your groin and then frowns, obviously disappointed with what she finds there. Before you have a moment to react, she spins away with a murmured <i>“thank you.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[FOR MALES/HERMS] [See parentheses for editions which must be made based on character]
public function firstTimeWithSellesyForCocks():void {
	clearOutput();
	showSellesy();
	author("Mr. Writer");
	output("The gyration of her hips increase in intensity. A series of delicate little moans escapes her, biting her lip in ecstasy. ");
	//For massive cocks, 24" plus: 
	if(pc.shortestCockLength() >= 24) 
	{
		output("Your massive cock, already hardened by the experience thus far");
		if(!pc.isCrotchExposed()) output(", begins to stretch your [pc.lowerGarment] to the limit.");
		else output(", begins to stretch to its full, erect size.")
	}
	else output("[pc.EachCock], already hardened by the experience thus far, responds naturally.");
	output(" A wet, slick feeling is growing at your stomach, as your pre-cum is rhythmically squeezed from your cock, one drip at a time. You give her ample area to grind against.");

	output("\n\nThe intense heat, damp around your crotch, tells you she’s close. You exhale in shock as her legs clamp even tighter around you, and her pussy begins to frantically rub against your hardened length, trapped between your stomach and her hungry core. The orgasm within you builds steadily, and as this incredibly sensual moment peaks, you cum uncontrollably, trapped in the vice-grip of three orgasmically-clenched thighs.");
	output("\n\nShe cries out breathlessly, throwing her arms around your back and holding you close as her entire body seizes up and you feel your own climax shiver through your trapped body. As her pussy clenches and drips hungrily against your cock in the throes of orgasmic bliss, you can only imagine what it would be like to be inside her.");
	processTime(5+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sellesyPostDrinkEpilogue);
}
//[FOR FEMALES]
public function firstTimeWithSellesyForVagoos():void {
	clearOutput();
	showSellesy();
	author("Mr. Writer");
	output("The gyration of her hips increases in intensity. A series of delicate little moans escape her, making her bite her lip in ecstasy. Your own pussy, hot and moist, feels her simmering wet heat as she grinds against your crotch. You can tell she’s close, but can only exhale in shock as her legs clamp even tighter around you, and her pussy begins to frantically rub against your moistening slit. Your own orgasm builds steadily, this incredibly sensual friction driving you towards the edge until you cum uncontrollably, trapping you in the vice-grip of three orgasmically-clenched thighs.");
	output("\n\nShe cries out breathlessly, throwing her arms around your back and squeezes you close as her entire body seizes up, and you feel your own climax shiver through your trapped body, her pussy clenching hungrily against yours. With your scant clothing separating the two, it feels wonderfully erotic.");
	processTime(5+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sellesyPostDrinkEpilogue);
}

//**************************
//2B. “Having a drink”
public function repeatDrinkyDrink():void {
	clearOutput();
	showSellesy();
	author("Mr. Writer");
	output("As Sellesy casually strolls off to ‘prepare’ your drink, you take the opportunity to have a more in-depth look around the bar. There’s a wide variety of patrons, from what you can see through the incense, although many of them are seedy folk in nature. Given the nature of the bar, it’s unsurprising.");
	//[Then continue the “First Drink” scene from the line: A soft, plush, yet firm touch presses against your cheek, bringing your attention to your front.]
	firstDrinkFromSellesy(false);
}

//*********
//“After Drinking”
public function sellesyPostDrinkEpilogue():void {
	clearOutput();
	showSellesy();
	author("Mr. Writer");
	processTime(15+rand(10));
	output("You awaken a short while later, held in her tender arms as she holds you close to her bountiful bosom in the chair, which has grown to accommodate you both. Your stomach feels a little bloated, no doubt from draining her colossal tit, and yet now that you look to her remaining, untouched pair, they seem positively swollen!");
	output("\n\n<i>“I hope you enjoyed your drink,”</i> she whispers in your ear, her lips pressing against it as though she’s kissing your mind itself. <i>“I hope you’ll come back soon, but of course... there’s no need to run off just yet, is there? After all, you’ve still got two more ‘drinks’ left...”</i> she adds with an amused chuckle.");
	output("\n\nA drip of sweat crests her head-spinning cleavage, but she seems undaunted by the prospect of another round. In fact you think it must be almost uncomfortable to have her tits so full. So very... very full....");
	output("\n\nThe thought of nursing from her again makes your stomach groan with hunger, and it’s impossible for you to ignore how your indeterminably long time with her has left you feeling. You feel extremely warm and oh so relaxed in her arms, overall refreshed and yet... content.");
	output("\n\nWould it really be so bad to stay here with her a while longer?");
	//[Options: Leave, go upstairs to her "private room"]
	clearMenu();
	addButton(0,"Stay With",stayWithSellesy,undefined,"Stay With","You doubt you’ll be able to stick around without things getting a little sexual...");
	addButton(14,"Leave",mainGameMenu);
}

public function stayWithSellesy():void {
	clearOutput();
	showSellesy();
	author("Mr. Writer");
	output("Sellesy leads you up to her lavish, if modestly sized apartment above the bar, and she sits back contentedly on her large bed. She obviously earns enough to live very comfortably.");
	output("\n\n<i>“Hmmm... I guess you’ve got a bit of energy you want to put to use huh? Not to worry... I’ll help you burn that off,”</i> she quips with a smirk.");
	output("\n\n<i>“What did the " + pc.mfn("strapping lad","delicious looking girl","gorgeous creature") + " standing before me have in mind?”</i>");

	//[Options: Titjob (males/herms), Blowjob (males/herms), Vaginal (male/herms), Scissoring with clitentacle penetration (herms/females), 69 (males/herms/females)
	//[TITJOB - For Males/Herms any size cock]
	clearMenu();
	if(pc.hasCock())
	{
		addButton(0,"Titjob",titJobFromSellesy);
		//[TRIPLE FOOTJOB - For Males/Herms with BIG dicks, too big for her maximum of 24" length, 3"wide.] 
		if(pc.biggestCockLength() >= 24) addButton(1,"Tri-Footjob",tripleFootjob);
		else addDisabledButton(1,"Tri-Footjob");
	}
	else
	{
		addDisabledButton(0,"Titjob");
		addDisabledButton(1,"Tri-Footjob");
	}
	if(pc.hasVagina())
	{
		if(pc.wettestVaginalWetness() > 2) addButton(2,"Tribadism",sellesyTribadismIsBadYoByZ,undefined,"Tribadism","Have a little girly fun between two wet, consenting adults.");
		else addDisabledButton(2,"Tribadism","Tribadism","You aren’t wet enough for tribadism with Sellesy. You’ll need a vagina that lubricates a little harder first.");
	}
	else
	{
		addDisabledButton(2,"Tribadism","Tribadism","You’ll need a vagina for this.");
	}
	if(pc.hasCock()) addDisabledButton(3,"SixtyNine","Sixty-Nine","You can’t have a penis for this.");
	else addButton(3,"SixtyNine",ladyType69WithSellesy,undefined,"Sixty-Nine",("Sixty-nine with the bartender. " + (pc.hasVagina() ? "You’ve both got pussies and tongues - why not use them" : "At least you’ll get to eat her pussy, right") + "?"));
	
	//button name (probably): Strap-on Play
	if(pc.hasHardLightEquipped() && pc.hasHardLightUpgraded()) addButton(4,"Strap-On Play",sellesyHardlightScene,undefined,"Strap-On Play","Let Sellesy play with your adjustable hardlight.");
	else addDisabledButton(4,"Strap-On Play","Strap-On Play","You need to wear hardlight-enabled underwear with an upgrade kit installed for this.");
}

//[TITJOB - For Males/Herms any size cock]
public function titJobFromSellesy():void {
	clearOutput();
	showSellesy(true);
	author("Mr. Writer");
	var x:int = pc.biggestCockIndex();
	output("Pulling you gently onto the bed, once in the embrace of her arms, you feel the rather snake-like sensation of her three legs beginning to embrace you once more. One leg worms its way ");
	if(pc.legCount == 1) output("around your [pc.leg]");
	else output("between your [pc.legs]");
	output(", its reverse position on her anatomy allowing her foot to gently massage your cock momentarily on it’s way past. Her other two legs contract around your midsection, her calves crossed across your lower back, as she slides you up along her stomach.");
	output("\n\nThe tits that still boggle your mind even now lay perky as ever, standing in a row like soldiers on parade. As she slides you forward, with her free hands, she begins to massage her nipples. Once fully erect, you swear they’re practically throbbing as blood flows through them, and a steady trickle of her cream begins to drip every which way down them, funneling into the canals of either cleavage. So flush are they against each other, so tightly pressed together by their sheer perkiness, that small pools of creamy liquid have formed where breast meets chest.");
	output("\n\nWith a finger, she dips into one of them, and sucks longingly. As her tongue swirls around it, obviously enjoying her own taste as much as you do, you feel your cock hardening against her abdomen in response to the lascivious display. She begins to dip her fingers deeper and deeper into her cleavage, licking away at the excess cream each time, and you realize she’s lubricating her tits with her own lactation.");
	output("\n\nAs this dawns on you, you feel those powerful legs squeeze a little, and slide you further up her body, slightly aided by the now milky-slickness the constant dribbling of her tits has provided. She cranes her neck to see over her own bust, and guides you to her left cleavage. The feeling of your [pc.cockHead " + x + "] against the soft globes of her under-boob is something you promise yourself you will never forget. A slightly warm trickle passes ");
	if(pc.balls > 0) output("under your [pc.balls]");
	else output("across your taint");
	output(", and you panickedly wonder if just the thought of those tits around your [pc.cock " + x + "] might have caused you a little too much excitement. However, you see her with some noticeable effort pulling her tits apart, creating just enough relief to allow her cream to drip through the insane chasm that is her cleavage.");
	output("\n\nLoosening just enough to allow the slick substance to lubricate between her tits, and drip along your cock in the process, with one last tug of her legs, you feel your [pc.cock " + x + "] slide home. Truly, there’s no better way to put it, as you truly feel at home here more than anywhere else, ever before.");
	//[If their cock is more than 24" Long]
	if(pc.cocks[x].cLength() >= 24)
	{
		output("\n\nAs you feel your entire length slide through the soft, warm cocoon, you feel the tip of your cock poke out into an almost cool pool of liquid. You can’t see past her tits anymore, barely able to see her face above them, but you know you must have bottomed out, and poked through to the other side of her impossible cleavage.");
		output("\n\n<i>“Oooh... something for me to play with up here!”</i> she remarks excitedly, and you feel a warm, wet, slippery thing begin to lick and caress across your [pc.cockHead " + x + "].");
		output("\n\nShe giggles and groans delightedly as she gets to lick and suck on your cream-flavoured cockhead whenever it pokes through.");
	}
	output("\n\nShe begins to slowly clench and relax her legs. Just that effort alone is enough to push your [pc.cock " + x + "] in and out of its new found home, causing you to gasp in sheer delight. When she starts pushing your ass in with her third foot, however, it truly makes your mind spin. Closing your eyes, it’s hard for you to conjecture at what’s going on, but your thoughts decides that all that matters is how perfect the softest, warmest, slipperiest pillows are while you’re fucking them. Your pleasure-slackened jaw grins ever so slightly as you realize that’s not too far from the truth, and your body begins to naturally start fucking the delightful pillows.");
	output("\n\nHer foot, previously using your ass as leverage, now leaves you to rut, captive between her legs. Instead, you feel her toes begin to tickle against your ass cheeks. An arm reaches out from the side of her tits, followed by another from the opposite side. Immediately, you feel her tits begin to squish together, and your breath catches in your throat. As her hands grasp your cheeks, you feel her tits press together tighter and tighter, and small rivers of cream stream from her nipples as her swollen tits collide. Leaving you breathless, she pulls you in for a kiss. Your chin rests against the swell of her middle bosom, as she stretches her head over to kiss you. Her hard, prominent nipples poke into your chest, and leave wet spots wherever you rest.");

	output("\n\nMeanwhile, a single toe worms its way between your ass-cheeks and suddenly tickles against your [pc.asshole]. Eliciting a gasp from you, you try to break from the kiss in shock, but she merely wraps her arms around your shoulders and pulls you back in harder. With one deft plunge, her toe pushes into your ass and stretches ever so gently at your sphincter.");
	output("\n\nHer toe begins to wiggle back in forth, resulting in a very odd sensation. As you are manipulated so as to keep fucking her tits, however, it’s hard to ignore how quickly that odd sensation is becoming a pleasurable one.");
	output("\n\nFor some time, you lay there, trapped between her arms, legs, tongue, lips, tits, and mischievous toes. At last, however, she removes her toe, and your sphincter clenches in what you find hard to deny as longing. Pulling back slightly, you stare mildly questioningly, before you feel her arms at work, and feel an almost alien sensation of something solid against your cock, having spent the last who knows how long knowing only the sheer softness of her breasts.");
	output("\n\nOnly when you feel a temporary breath of cool air against your [pc.cock " + x + "] do you realize she’s simply swapping you to her other cleavage. The subtle difference between one pair of tits and the other is one that only a true connoisseur could appreciate, and you want to spend as much time as you can becoming one.");
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

	output("\n\n<i>“Ooh!”</i> she squeals softly in utter delight. <i>“Is this for me? I DO love a good ‘cock’tail!”</i> she quips, before immediately slurping away at the mixed liquids with her rather long tongue. You might almost feel the need to chastise her for her terrible puns if not for the mind-numbing orgasm still blowing through your body and the utterly erotic sight of her tongue dancing amidst the post-coital fluids on her bountiful breasts.");
	output("\n\nWith a look in your dazed eyes, she smiles knowingly and pulls you closer to her breast, rolling you to one side and holding you in the midst of one of the best come-downs of your life. You feel very fuzzy-headed and almost overwhelmingly relaxed, your head now resting against her warm, still slightly slick breasts, and your mind filled with the sounds of her gentle breathing. You very easily drift to sleep in her caring arms.");
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
public function tripleFootjob():void {
	clearOutput();
	showSellesy(true);
	author("Mr. Writer");
	output("Dropping your [pc.gear], you can see she is immediately astounded by what she sees. She paws closer from her position on the bed, and reaches out almost in awe. As she gently massages [pc.oneCock], and measures it against her forearm, her eyes widen ever so slightly in realization.");
	output("\n\n<i>“I didn’t realize you were so big... sorry honey, I just don’t think it’ll fit. Even our kind have limits,”</i> she says rather softly, sounding genuinely disappointed.");
	output("\n\nSuddenly, her eyes light up, and she motions towards her bed. Wondering just what she has in mind, you follow her curling finger as she lowers herself down to her sheets.");
	output("\n\nShe wraps two of her legs around your center, placing her feet on opposite buttcheeks and pulling you, and your dick, well within her reach.");

	output("\n\nWith your thighs flush against the edge of her bed, she stretches out, prostrating herself in front of you. Still unsure of what to expect, she delicately brings her feet to bare. Resting her three, soft, rather flat soles against and around your considerable length, it’s now quite obvious what she has in mind, as she presses your [pc.cockHead " + x + "] against her now open, three-cornered pussy.");

	output("\n\nWith rather deft ease, she begins to massage your cock at a relaxed pace, not breaking rhythm even as your cock hardens and begins to push you away from her slightly. You have to admit, this does feel amazing. Watching her lay back and looking so relaxed, “hands-free” as it were, and the feeling of her three rather large yet soft feet all over your [pc.cockBiggest] has a charm in and of itself. Usually you would think a foot job might take a little more effort to get you off but with all three of her feet working in tandem, you find yourself very swiftly approaching your limit.");

	output("\n\nShe reaches down between her front most legs with one arm and vigorously plays with her exposed clit. With each moan, you feel her pussy clench against your cockhead like a hungry mouth. The image sticks in your mind and swiftly drives you closer and closer to what you can already tell will be a ");
	if(pc.balls > 0) output("ball-churning ");
	else output("prostate-emptying ");
	output("climax.");

	output("\n\nThe sound of her moans echoing past the titanic bosom, and engulfing legs, is almost musical. All at once a rough and primal sound, and yet delicate like the tinkle of glass. Everything about this woman is so entrancing, so fascinating; you hope this wont be the last time you see her... for several reasons.");
	output("\n\nWith a quickening of her breath, her feet increase their pace, sliding gracefully back and forth along your massive cock, now slick with a combination of lubrication. Her feet synchronize so they nearly meet edge to edge around your shaft and begin to slide in unison up and down, up and down... her ankles just barely cresting the your [pc.cockHead " + x + "], her toes tickling gently as they reach your groin.");

	output("\n\nFinally, the combination of this erotic, perverted entwinement proves too much, and you feel an all too familiar throb throughout your [pc.cockBiggest], which leaves a distinct tingle in your tip. Obviously feeling this, she merely groans with indulgence, her pussy hungrily mouthing against your cock.");
	output("\n\nSuddenly, you feel an awfully strange sensation, as you look down to see a small tendril entwining her fingers... and realize that she is no longer playing with her clit. Instead her clit is playing with her.");
	output("\n\nThe two other clitori you now see slithering around and across your cock, providing a delectable sensation which merely adds to the sensation in your pleasure-addled mind.");
	output("\n\nAs much in unison as her feet are, you feel your climax and hers approaching quickly. All at once, her clitoris-tentacles encircle your cock around the [pc.cockHead], just able to form a sort of “ring” just beneath it, and begin to writhe around, drawing an utterly gratified moan from deep within you.");

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

//Sellesy-female scene 1 - tribadism+
//-F and H only, require vaginal wetness at least 2 higher than minimum
//-quadruped-ready
//-unavailable if balls > 18”
public function sellesyTribadismIsBadYoByZ():void
{
	clearOutput();
	author("Zeikfried");
	showSellesy(true);
	output("<i>“I don’t know, honey,”</i> Sellesy temporizes, when you state your request. <i>“I like my sex to be a bit more... well, fluid. The last time was fun and all, but I get so... so </i>thirsty<i>");
	if(!pc.hasCock()) output(" when there are no drinks on tap");
	else output(" the taps are off-limits");
	output(".”</i> She giggles brazenly at her own joke, then licks her lips.");

	output("\n\nYou know damn well she’ll do you anyway. The tipsy throb in your head begins to hammer in time with the swaying of her breasts as she sashays over to your side. With a smile and a bump, she pushes her soft, yielding chest into you, knocking you ");
	if(!pc.isTaur()) output("onto the bed");
	else output("onto your rump");
	output(". The waitress purses her lips and bends down, placing a finger on your ");
	if(!pc.isTaur()) output("midriff");
	else output("barrel");
	output(" and tracing downward, ");
	if(pc.hasCock()) output("deliberately circling your [pc.cocks] and ");
	output("almost touching [pc.oneVagina]. Stopping just short, she asks, <i>“What’s in... </i>it<i> for me?”</i>");
	//(nudists)
	if(pc.isNude())
	{
		output("\n\nThe pulse in your head picks up tempo when she leans forward, three breasts dangling like perfect pendulums. You shift on the ");
		if(!pc.isTaur()) output("bed, feeling the exquisite velvety tongues of the fabric on your [pc.butt]");
		else output("ground, shivering as the cool, smooth surface glides across your [pc.butt]");
		output(". The sensations seem to magnify threefold, screaming for the attention of your drink-fogged mind, as you ");
		if(pc.legCount > 1) output("slide open your [pc.legs] to ");
		output("reveal what has been forming beneath your body. Sellesy remains unmoved, at first, and you ");
		if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("blush");
		else output("grin");
		output(" a bit as you take hold of her warm hand. Her eyes finally register the discovery at the same time as you push her fingers into it: the ever-spreading puddle of lubrication leaking from your aroused [pc.vagina].");
	}
	//(clothed)"
	else
	{
		output("\n\nYour consciousness flutters in synchronization with the quivering of her breasts as she leans in, and you feel your breath become thick and husky. It smells sweet to you as she pushes her tits closer and it flows back into your face. Taking Sellesy’s hand in yours, you slip it ");
		if(!pc.isTaur()) 
		{
			if(pc.isCrotchGarbed()) output("past your waist, into your [pc.lowerGarment]");
			else output("down to the all-too-moist delta below");
		}
		else output("over your bountiful backside, half-gesturing and half-pushing it toward the genitalia you can’t quite reach on your own");
		output(". Sellesy’s expression is the same seductress’s smile all the while you guide her along your feverish body, but as she reaches your labia, her eyes widen with excitement and... hunger? She slips her fingers inside your [pc.vagina] and crooks them a bit, pulling out a trickle of lubrication alongside them. It drools ticklishly down your butt as she examines the wet shine on her hand.");
	}
	//(merge)
	output("\n\n<i>“Well, that’s a very interesting offer,”</i> Sellesy declares, recovering her composure. <i>“I think we can definitely work something out.”</i> She slips her fingers into her mouth and grins around them. Eager to have them, or anything else, back inside you, you scoot closer to her and trace once around one of her slick nipples.");
	output("\n\n<i>“So...?”</i> you goad, watching her shiver slightly.");
	//(quadruped)
	if(pc.legCount >= 4)
	{
		output("\n\nSellesy tiptoes around to your backside, elegantly stepping over your prone form. <i>“Such an interesting body you have,”</i> she muses, tugging gingerly on your ");
		if(pc.tailCount > 0) output("[pc.tails]");
		else output("labia");
		output(". You shift awkwardly, still eager for stimulation, but she releases her grip. <i>“Now, now. This will be delicate. You had better let me steer, there’s a good " + pc.mf("boy","girl") + ".”</i> A warmth and weight press against your rump and one of Sellesy’s legs threads between yours, crooking its knee around ");
		if(!pc.hasCock() && pc.balls == 0) output("your own");
		else
		{
			output("your ");
			if(pc.balls > 0) output("[pc.balls]");
			if(pc.balls > 0 && pc.hasCock()) output(" and ");
			if(pc.hasCock()) output("[pc.cocks]");
		}
		output(". You lift your backside partway off the floor obligingly as another one drags along your back, kneading your muscle with the heel. When you look back, Sellesy stands there awkwardly, supporting herself on one leg and leaning over your [pc.butt] as she guides her pussy toward yours. She smiles as your eyes meet.");
	}
	//(monopod)"
	else if(pc.legCount <= 1)
	{
		output("\n\n<i>“This will be fun,”</i> Sellesy announces, mounting the bed and you as well. As she gently pushes your shoulders backwards, two legs slip over your body. A warmth hotter than skin brushes over your labia, and Sellesy shivers.");
		if(pc.hasCock())
		{
			if(pc.cockTotal() == 1) output(" Your cock hardens and smears");
			else output(" Your cocks harden and smear");
			output(" against her stomach, leaving translucent trails of [pc.cumColor] pre-cum in your excitement. She stares affectionately at them momentarily, but brushes them away. <i>“Not just now, my lovelies.”</i>");
		}
		output(" Sellesy grinds experimentally against you, smiling as your lubrication spreads smoothly around.");
	}
	//(biped/other)");
	else
	{
		output("\n\nSellesy practically glides onto the bed, capturing your [pc.leg] between two of hers. A sharp intake of breath follows, as something warmer than skin presses against your labia. <i>“Here we go...”</i> she murmurs, then smiles. The lubrication, trapped with no way to escape, begins to build up between you.");
		if(pc.hasCock()) 
		{
			output(" Equally victimized by her teasing, your ");
			if(pc.cockTotal() == 1) output("cock stands");
			else output("cocks stand");
			output(" upright, begging for attention with droplets of ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" own.");
		}
	}
	//(merge legs)
	output("\n\nYou smile yourself when she moves again. Sellesy’s hips shift to the side, then down, then back. Your labia are gently probed first with one of the server’s protruding nubs, then another and another, in a steady-but-chaotic dance. Moisture trapped within is given the chance to slip out in small licks as she moves, lubricating the pinwheel that rubs against you. Sellesy’s speed increases as the resistance lessens.");
	//(no quadrupeds)
	if(!pc.isTaur()) 
	{
		output("\n\n<i>“Mmm,”</i> she hums, arching her back. Her breasts dangle fetchingly over you, and your hands automatically grab the outer pair. When you pinch a nipple, Sellesy’s head rolls back and a low moan fills the room. <i>“Do that again,”</i> she demands, <i>“harder.”</i> Her hands clap over yours, forcing you to squeeze and pull her nipples. A small jet of fluid erupts from them, squirting you in the neck and face; it smells strongly of alcohol. Sellesy looks down at you, eyes heavily shaded with pleasure. <i>“Sorry about that, lover.”</i> She leans down, brushing her dribbling breasts against ");
		if(pc.biggestTitSize() > 1) output("yours");
		else output("your chest");
		output(", and her tongue runs over your collarbone. She sponges the fluid from the underside of your chin and moves up to your face. The lick turns into a kiss at the corner of your mouth, and then a second one on your lips. As her hands clasp your head on either side, her tongue forces its way into your mouth alongside the taste of the alcohol. Just as you begin to explore it with your own, she pulls it out as quickly as it came and breaks the kiss with a playful love-bite. <i>“It’s quite a bit stronger when I’m excited,”</i> she says huskily, licking her lips");
		if(pc.legCount == 2) output(" and moving back into position against your [pc.vagina]");
		output(".");
	}
	output("\n\nHer spiraling tease with vigorous strokes begins to smother your own");
	if(pc.hasClit()) output(" [pc.clits] and");
	output(" labia. The bumps drag on longer with every pass; indeed, it seems as if the motion of Sellesy’s hips is exaggerated, gliding in one direction for seconds before she slides onto a new tangent. Before much longer, it feels like she’s gliding along on a cushion that sits between you. The merest hints of sensation reach your own desperate depths, but Sellesy’s head whips around with obvious pleasure, and she hums constantly.");
	output("\n\n<i>“Hey,”</i> you interrupt drunkenly. Sellesy seems not to notice, beginning a new slide to the side, so you ");
	if(!pc.isTaur()) output("grab her hips");
	else output("buck your rump");
	output(" to disrupt her. <i>“Hey!”</i> Sellesy’s reverie breaks, and she meets your eye.");
	output("\n\n<i>“What?”</i> she asks, still hazy with arousal.");
	output("\n\n<i>“I can’t feel anything,”</i> you reply, thrusting your pelvis into the pliant mass between you. The server blushes and, at length, pulls away. A fleshy swirl on her underside untwists rapidly, revealing Sellesy’s three clitorises, fully extended and shiny with lubrication.");
	output("\n\n<i>“Oops.”</i> The foremost clitoris curls and flexes on itself. <i>“We’ll just have to find a way to help you feel.”</i> Her vagina presses up to yours once again, and her clitorises lap at your pelvis, one caressing your mons and others teasing your ");
	if(!pc.isTaur()) output("thighs and ");
	output("backside. <i>“How about this?”</i> she challenges.");
	if(pc.hasCock() || pc.hasClit())
	{
		output(" A hot, slippery grip winds around your ");
		if(pc.hasCock()) output("dick");
		else output("[pc.clit]");
		output(", curling and uncurling along ");
		if(pc.hasCock() || pc.clitLength > 6) output("its length as she gyrates, like a lewd barber pole");
		else output("your button, slurping and sucking like a needy mouth");
		output(".");
	}
	output(" The tentacle furthest from your view slides between the cheeks of your [pc.butt]. teasing and probing your [pc.asshole] with its tip");
	if(pc.analCapacity() < 100) output(", but cannot find its way inside");
	output(".");
	//[(loose butt)
	if(pc.analCapacity() >= 100) 
	{
		output(" Sellesy’s searching stalk easily penetrates your well-loved rear, sinking in to ");
		if(pc.hasCock()) output("stimulate your prostate and heighten the experience of the first tentacle, forcing a steady stream of fluid from your aching glans that dribbles down only to be whisked away by her other curling clitoris");
		else output("tickle your hole from the inside, stroking spastically against your nerves in time with her own shivering pleasure");
		output(". She smiles a worldly, knowing smile at you as your yielding anus gives her free play.");
	}
	output("\n\nSo situated, Sellesy slides a hand ");
	if(pc.isBiped()) output("between your [pc.legs]");
	else output("to your vagina");
	output(", gently tugging at your labia. And then, with a sudden slick rush, the last and final clitoral tentacle is inside, but just barely. As she grinds against you, the tip of it curls in the opening to your pussy, circling and stroking the sensitive entrance as the bulk rubs against your labia. With incredible clitoral dexterity, her flexible flesh dips bodily into you and then back out, filling your pussy and yet leaving enough of the end free to tickle your urethra.");
	output("\n\n<i>“Better?”</i> she teases, leaning low over your ");
	if(pc.isTaur()) output("back");
	else output("chest");
	output(" to stare into your face. You don’t even answer, too busy trying to stave off climax as she ");
	if(pc.hasCock()) output("rubs you off with a tentacle like a tongue");
	else output("rubs your own sensitive clitoris with one that feels more like the mouth of a desperate lost love");
	output(". Your [pc.asshole] is tickled");
	if(pc.analCapacity() < 100) output(" and circled, heightening the sensation");
	else 
	{
		output(", circled, and violated so hard that ");
		if(pc.hasCock()) 
		{
			output("you’re already shooting [pc.cumColor] onto the ");
			if(pc.isTaur()) output("floor");
			else if(pc.shortestCockLength() < 12) output("underside of her tits");
			else output("server’s lustful smile");
			output(" from your prostate orgasm");
		}
		else output("your back spasms and locks up firmly enough to leave the burden of moving around squarely on Sellesy as your asshole tries to wring her dry");
	}
	output(". It’s far too difficult, and your [pc.vagina] clenches down on a tentacle that just as quickly slips out of its grasp. Sellesy’s knees bend, locking your [pc.legOrLegs] into hers, as she positions her opening directly opposite to yours. <i>“Squirt for me, my beautiful fountain!”</i> she cajoles. <i>“Put on a lovely display!”</i> Your pussy gapes and grabs air as your body empties moisture and ejaculate into your insatiable lover.");
	if(pc.isSquirter())
	{
		output(" Rivers of joy run from your overproductive body, filling Sellesy faster than her own greedy entrance can drink it down; a soup of mixed juices slips from between you to spatter below with every pleasurable spasm.");
		if(pc.hasCock())
		{
			output(" With [pc.eachCock] twitching, the male part of your anatomy fills the air with ");
			if(pc.cumQ() < 14) 
			{
				output("a sparse shower of sperm that adorns ");
				if(pc.isTaur()) output("the slick and sticky floor");
				else output("your lover’s neck, breasts, and taut stomach when she leans into it");
			}
			else output("a mess of musk that only sprays with more pressure when Sellesy tries desperately to squeeze the end, splattering everything - the woman, the bed, the floor - with [pc.cumColor]");
			output(".");
		}
	}
	output("\n\n<i>“Much better,”</i> you mumble, flopping onto your side.");

	output("\n\n<i>“Oh, are we done?”</i> Sellesy asks innocently. The ");
	if(pc.hasCock() || (pc.hasClit() && pc.clitLength > 6))
	{
		output("tight squeeze on your ");
		if(pc.hasCock()) output("dick");
		else output("clitoris");
	}
	else
	{
		output("slow, smooth scrape on your");
		if(pc.hasClit()) output(" clitoris");
		else output(" sex");
	}
	output(" is the only alarm you get before she cozies all the way up to your post-coital glow. Her clitoral tentacle slides between your labia again, and she leans low one more time. <i>“I find that the best thing about ");
	if(!pc.hasCock()) output("women");
	else output("hermaphrodites");
	output(", aside from just being nicer to look at, is that they... enjoy a woman’s refractory period.”</i>");

	output("\n\nA low groan escapes your throat as her tentacle slips the rest of the way into your sensitized vagina. She ");
	if(pc.isTaur() || pc.biggestTitSize() < 1) 
	{
		output("rakes her fingernails down your ");
		if(pc.isTaur()) output("back");
		else output("chest");
	}
	else output("grabs your breasts in her hands, squeezing and then releasing,");
	output(" as she straightens out and ");
	if(pc.isTaur()) output("faces the opposite direction from you; her fingers dig into your rump as she prepares to assault your pussy again");
	else output("sits fully erect atop your pelvis; your back curves and your ass slides forward automatically as your pussy chases hers, eager to preserve contact, and it only serves to amplify your respective positions");
	output(". As your eyes follow her increasingly distant face, you spot a sadistic grin just before her head rolls around to face ");
	if(pc.isTaur()) output("the opposite wall");
	else output("the ceiling");
	output(". The tentacle dithering around your entrance suddenly swells to fill you, and you wonder what she’s done. The answer comes in the next moment, when you feel the tip brush at your cervix gently: she’s thrust it all the way in, up to the base.");

	//Human PC or Gspot?
	output("\n\n”</i><i>Aha-ha...”</i> she gasps. The tentacle curls inside you, obviously searching for something rather than thrashing randomly. <i>“I’ve only done this a few times, but as I recall, there’s something special here somewhere...”</i> Sellesy’s clitoris flexes forward, dragging along the front of your vagina, and your back locks up as your mind whites out with pleasure. Your lover smiles, unobserved by you, as you twitch in response to her presses. <i>“Here we go,”</i> she mumbles");
	if(pc.analCapacity() >= 100) 
	{
		output(", and you feel your asshole being invaded again. The sensation of being penetrated in both holes only serves to intensify the blank in your head");
	}
	output("; you can do little as she explores to her heart’s content.");
	if(pc.hasCock())
	{
		output(" Your [pc.cocks], half-flaccid, slowly ");
		if(pc.cockTotal() == 1) output("fills");
		else output("fill");
		output(" with blood again,");
		//(tightass)
		if(pc.analCapacity() < 100) output(" dribbling the slightest bit of pre-cum, not yet ready for another round.");
		else output(" already squirting into the air from prostate stimulation. It’s enough to be mistaken for a full orgasm, and Sellesy watches wistfully.");
	}
	output("\n\n<i>“");
	if(pc.libido() < 50) output("S-stop");
	else output("M-more");
	output("...”</i> you beg. Your lover’s only answer is a particularly exaggerated slide that drags her own labia over yours in ultra-close contact, and then she begins to pull her crotch away from yours, only to slam it back down, forcing her clitoris in all the way and rubbing the coiled tip against your inner walls, directly over your most pleasurable place. Your back spasms again, cutting off further speech; Sellesy mercilessly repeats, groaning from her own clitoral pleasures as she fucks you. It’s an hour before you come again, and Sellesy’s tentacle once again pulls free to let her thirsty pussy drink deeply of you.");
	if(pc.hasCock())
	{
		//[(smallcum)
		if(pc.cumQ() < 25) 
		{
			output("Several small ejaculations don’t quite reach ");
			//(quad)
			if(pc.isTaur()) output("the same distance on the floor");
			else output("the previous ropes, now beginning to dry on your lover’s skin.");
		}
		//(bigcum)
		else
		{
			output("Your ");
			if(pc.cockTotal() == 1) output("cock fires");
			else output("cocks fire");
			output(" again, and your lover once again tries to grab the tip. The smile that parts her lips as your cum splatters her for the second time is enough to tell you that she knew what would happen - and that she likes it.");
		}
	}
	output("\n\nCompletely blown away, you slump onto the damp ");
	if(pc.isTaur()) output("floor");
	else output("bed");
	output(" and Sellesy’s clitoral tentacles slowly retract from their stations in and around you. Sellesy unentangles herself from you, ");
	if(pc.hasCock())
	{
		if(pc.cumQ() < 25) output("idly wiping some of your semen from her skin and licking her fingers");
		else output("eyes glittering at the buffet you’ve ejaculated all over the room. She idly wipes some of your semen from between her cleavage and licks her fingers");
	}
	else output("and a small trickle of fluid escapes her pussy before she clamps her legs shut.");
	output("\n\n<i>“Come again,”</i> she whispers sweetly, as you pass out.");
	//reduce libido?
	if(pc.libido() > 50) pc.libido(-1);
	if(pc.libido() > 70) pc.libido(-1);
	if(pc.libido() > 90) pc.libido(-1);
	processTime(68+rand(10));
	if(pc.credits >= 50) pc.credits -= 50;
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sellesy-female scene 2 - 69(or not)
//-F and U only
//-off-limits to quadrupeds and nudists
public function ladyType69WithSellesy():void
{
	clearOutput();
	author("Zeikfried");
	showSellesy(true);
	output("Sellesy seems markedly nonplussed at your crotch once you reach the room. Dropping your recently-attached underwear to the side, she almost glares at you when her eyes meet yours. <i>“Not to be indelicate, my erstwhile lover, but far enough is far enough. How exactly are you going to make this worth my while?”</i>");
	if(!pc.hasVagina()) output(" She taps petulantly on your blank pelvis. <i>“You only have one hole down here, and I’m </i>not<i> eating anything that comes out of it.”</i>");
	else if(pc.hasVagina() && pc.wettestVaginalWetness() < 2) output(" Her nimble fingers slide over your mound and directly into [pc.oneVagina] and you gasp. She withdraws them again, dry, and narrows her eyes slightly. <i>“Even with a spoon, I don’t think I could get much out of this.”</i>");
	else output(" Her fingers slip into [pc.oneVagina], and she raises an eyebrow at the soppy insides. <i>“If you were to run down to the bar and get me a drinking straw, we might have something to discuss...”</i>");

	output("\n\nThe pounding in your alcohol-mazed head both demands and inspires you to new depths of desperation. Taking Sellesy’s hand, you pull her body close to yours. <i>“I thought... maybe some fun that’s not suitable for the public view.”</i> Grudgingly held in place, Sellesy’s eyes slowly close as you take one of her nipples in your other hand. With repeated tweaks and pinches, a small trickle of fluid begins to dribble from the serving-woman’s breast. She shivers as the droplets descend the bottom curve of her lovely bust and roll onto her stomach, and her hand pulls free of yours to latch onto the nipple automatically. She massages her breast and, with a hand over yours, guides you to pinch and pull firmly. The trickle intensifies into a squirt.");
	output("\n\n<i>“Glass,”</i> she mumbles absently, free hand feeling about as if searching. <i>“Where’s... the glass?”</i> A second later, her eyes snap open, and she jerks her breasts away from you with an eye-catching jiggle. <i>“Well! That’s very nice, but I can do that quite well on my own, you know.”</i>");

	output("\n\n<i>“But you can’t do everything on your own,”</i> you counter, leaning across the distance and taking her wet breast in hand again. <i>“And it’s just not as fun, is it?”</i> Her head rolls back as you squeeze gently and you take the opportunity to kiss her graceful neck. She shivers again, but doesn’t try to pull away. Teasing her nipple in the way she just showed you, you succeed in producing a squirt of sweet-smelling booze. You can feel her throat swallowing hard under your lips and as her shoulders relax, you realize: <i>you’re getting to her</i>.");

	output("\n\n<i>“Lay down,”</i> you command. Sellesy looks at you dozily for a moment, and then complies. You lean over her, hand still cupping her breast. <i>“Spread your [pc.legOrLegs].”</i> She obliges, separating her three legs in a spidery welcome. Your hand slides from her alcohol-slicked breast, trailing wetness, slowly down her stomach, feeling it quiver with her anticipation. You reach the gap between two of her legs and linger there, staring into her eyes until she meets your gaze, and then slide the rest of the way until your fingers feel the bump that marks her entrance. The woman shivers under you as you work your way in slowly, tracing first the outlines of her unusual tripartite labia and then the ring of her vaginal opening. Deliberately, making sure she watches, you lean down between her legs and kiss her nearest exposed clitoris, which is twitching and flexing in place. Slowly pulling away, you glance between her thighs at your lover’s face.");

	output("\n\n<i>“Well-”</i>");

	output("\n\nYou can’t even finish the thought as something hot and muscular coils around your wrist; when you turn to glance toward it, two of her legs wrap around your back and her heels push your head right back down into her muff. Up close, you can see her three clitorises, fully extended, have a death grip on your hand.");

	output("\n\n<i>“Don’t stop,”</i> says a husky voice. <i>“Lick.”</i> Her thighs squeeze, pushing you closer to her pussy; one of her clitorises releases your wrist and rubs against the [pc.skinFurScales] of your cheek almost affectionately. Somewhat at a loss from this turn of events, you allow it to probe the corner of your mouth and use your tongue to flirt with the tip. Sellesy shakes and moans as her clitoris thrusts and dances through your mouth, tasting of oil. Hands clasp onto your hips, pushing on your body, and you feel a hot breath on your [pc.belly]. A sense of something near your [pc.butt] flits into your head, and then a warm, wet object forces its way through your ");
	if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.asshole]");
	output(".");

	output("\n\nThe pleasure and the surprise of your penetration momentarily demand all of your attention, but the slick clitoris in your mouth writhes impatiently when your ministrations stop, wrapping around your tongue and trying to wrestle it back into activity despite being unable to achieve any sort of grip. The serving-girl’s legs squeeze again, pushing your head forward, and you can almost feel Sellesy mouth the word ‘lick’ into your own fluttering ");
	if(pc.hasVagina()) output("[pc.vaginaNoun]");
	else output("asshole");
	output(". As soon as you comply, her hands abandon their posts on your butt to tease and twist her nipples, and soon the barmaid’s stomach is coated with spilled alcohol that froths as your bodies writhe against one another.");

	//(ladies)
	if(pc.hasVagina())
	{
		output("\n\nBoth unwilling and unable to break free of Sellesy’s strong legs while the sensational assault on your [pc.vagina] continues, you pull her oily clitoris from your mouth with your trapped hand and scoot forward. Sellesy pursues your slit as you reposition your body to allow your face to reach her empty, grasping entrance and stick your own tongue inside. Her clitorises release their grip on your wrist and wrap around your face, smearing lubrication on your [pc.skinFurScales].");
		//(no body/facial hair)
		if(!pc.skinType != GLOBAL.SKIN_TYPE_FUR && !pc.hasBeard()) 
		{
			output(" Restless with her excitement, they slowly move down your neck, wrapping around it and then just as quickly realigning themselves to ");
			if(!pc.isNude()) output("slip into your clothing and ");
			output("caress your ");
			if(pc.biggestTitSize() >= 1) output("breasts");
			else output("nipples");
			output(".");
		}
		//(furry or bearded)
		else
		{
			output(" Your lover giggles into your crotch as the hair of your face tickles her most sensitive organs, and they quickly retreat to flirt with your lips and tongue again.");
		}
		//(clit>12in)
		if(pc.hasClit() && pc.clitLength >= 12) 
		{
			output("Your own elongated ");
			if(pc.totalClits() == 1) output("button swells");
			else output("buttons swell");
			output(" to full size as her tongue works your nerve endings, and you can feel Sellesy’s hesitation as she considers how best to employ ");
			if(pc.totalClits() == 1) output("such an unfeminine appendage");
			else output("such unfeminine appendages");
			output(". It doesn’t take her long to decide; she tucks your [pc.clits] into her cleavage, leaving ");
			if(pc.totalClits() == 1) output("it");
			else output("them");
			output(" to receive an increasingly sloppy boobjob as she continues to pinch and milk her teats.");
			//9999 Below doesn't exist at present!
			//[(prehensile clit) Not to be outdone, your flexible [clitoris coils/clitorises coil] around her breasts, gently rubbing her nipples, coaxing out yet more of Sellesy’s reserve. She sighs in bliss as you feel a squirt of fluid hit your stomach. ]]");
		}
		output("\n\nAs your own efforts redouble, so too do Sellesy’s; first her tongue and then her fingers enter your [pc.vagina].");
		if(pc.looseness(0) > 3) output(" Even this is not enough: with fingers and tongue alone, she still can’t fill your stretched-out hole. When this becomes apparent, Sellesy shoves a whole hand into your gaping gash, halfway up to the elbow.");
		output(" She begins to pump, pushing in and out with her hand as she uses her tongue to caress your labia");
		if(pc.hasClit())
		{
			output(" and ");
			if(pc.clitLength >= 12) output("the base of ");
			output("your [pc.clit]");
		}
		output(". You answer with a similar assault on her own entrance, ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("though your inhuman tongue is long enough to caress all three of her clitorises and penetrate her of itself.");
		else output("sticking your fingers in as far as they will go while kissing, licking, and even gingerly biting the surface of any clitoris that gets in range.");

		output("\n\nIt doesn’t take long before Sellesy is moaning breathily into your vagina, too unstable from her milking and own approaching orgasm to properly lick pussy - but she keeps her hand working all the same, thrusting in and out of you. Her entrance squeezes your ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("tongue");
		else output("fingers");
		output(" so hard and for so long that you begin to tingle from the loss of circulation, and her clitorises are finally still, fully extruded but with muscles frozen in statuesque curls ");
		if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN || pc.hasBeard()) output("in the air around you");
		else output("along your face and chest");
		output(".");

		output("\n\n<i>“Fuuuuuck!”</i> she screams, all delicacy evaporated. Her legs unlock and slam into the bed, lifting you into the air when her back arches. Her climaxing body attempts to suck up all the moisture inside her vagina, and the warm slit around your fingers");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" and tongue");
		output(" turns into a hot, dry oven. The alien woman’s hips buck several times, thrusting against a missing lover, and she collapses. You pull your hand free and stare at your pruney fingers, pussy still burning for release that you’re no longer sure Sellesy’s hand will deliver.");

		//(clit>12in)
		if(pc.hasClit() && pc.clitLength > 12) 
		{
			output("\n\nWhen that hand slips from your [pc.vagina], to be replaced with nothing, you decide to take your climax into your own hands, semi-literally. Reaching under your stomach, you take Sellesy’s breasts into your hands, squeezing them around your [pc.clit], and begin to thrust your hips like a man. The liquid-soaked tits feel hot and amazing on your nerve-packed organ, and it’s less than a minute before you convulse in orgasm.");
			if(pc.isSquirter()) 
			{
				output(" A squirt of [pc.girlCum] erupts from you and hits the tired woman directly in the face. Sellesy sputters and coughs as you drench her in your love.");
				output("\n\n<i>“Ugh,”</i> she gripes. <i>“If you could do that, why did we go through all this?”</i>");
			}
			else output("”</i><i>I sincerely hope you had a nice time,”</i> she says, theatrically. <i>“Could you get off of me?”</i>");
			output("\n\nIn response, you trace a line along one of the woman’s exhausted clitorises, laying loose and limp, and watch her as she shivers with overstimulation. Laughing, you sit up and then lay beside her, kissing her on the neck. Sellesy consents to remain with you as you drift off into a nap, though you have no illusions that you’ll wake up in the same company.");
		}
		//(clit<12in)"
		else
		{
			output("\n\nWhat’s good for the goose is good for the other goose. Your ");
			if(pc.isNaga()) output("lower body coils around Sellesy’s head and back, uplifting her while smashing her face brutally into your [pc.vagina]");
			else if(pc.isGoo()) output("gooey pseudopod parts and reforms around Sellesy’s head, leaving her only a small air pocket placed right at the entrance to your [pc.vagina] and no other choice");
			else output("[pc.legOrLegs] wrap around Sellesy’s head, squeezing the woman’s still-hot face between your even hotter thighs");
			output(". <i>“Lick,”</i> you insist, echoing her earlier demand. Sellesy’s mumbled reply is inaudible through the [pc.butt] covering her head, but the pleasant vibrations do send a tingle to the base of your spine before she opens her lips and a wet muscle forces its way between your labia again. Her fingernails dig into your hips with such force that they ");
			if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("mark the skin");
			else output("would leave a mark on bare skin");
			output(", and she stimulates your slit with a surprisingly long tongue, stroking the inside of your hole");
			if(pc.hasClit())
			{
				output(" and darting out to pop your clitoris into her mouth like a ");
				if(pc.clitLength < 3) output("cherry");
				else if(pc.clitLength < 5.5) output("small penis");
				else output("throbbing phallus");
			}
			output(" with great skill");
			output(". The borderline abuse of your vagina by the re-energized Sellesy is enough to bring you to climax in minutes, and your pussy sputters out an orgasm");
			if(pc.isSquirter()) output(" and a gob of [pc.girlCum] that lands right in Sellesy’s mouth. She coughs as you continue to drench her face with your ejaculation");
			output(". Satisfied, you release Sellesy’s head.");
			output("\n\nShe says nothing as you lie atop her, and you allow yourself to drift into a light sleep, expecting to find yourself alone when you awake.");
		}

	}
	//(unsexed)
	else
	{
		output("\n\nYou do your best to tease Sellesy’s flesh-ivied pussy with your tongue, plunging it in and out and running it around the ring of her entrance as her clitoral tentacles wrap around your head and neck, oiling your skin with her lubricants, but the pleasure she visits on your anus is maddening. For every lick you bestow, it seems as though her tongue makes a complete circuit of your nerve endings. You attempt to focus on pleasing her, even through the light slaps of her clitorises on your cheeks, but she pulls away from your [pc.asshole].");
		output("\n\n<i>“You’re not actually very good at satisfying a woman, you know,”</i> she says. Your cheek tingles with embarrassment as her legs unlock and release you. <i>“Get up. I have a better plan.”</i>");
		output("\n\nYou climb off of the woman, fuming with things to say about her fucked-up frame of reference, but she repositions herself, reclining halfway and stretching out her bottom leg while planting the other two heel-down on the bed. When finished, her pussy faces partly upward. Studying the expression on your face carefully, Sellesy twists her three clitorises into a stalk that points into the air.");
		output("\n\n<i>“Have a seat,”</i> she suggests, with a domineering smile. The alien thrusts her hips pointedly at you.");
		//(buttvirgin and libido<=50)
		if(pc.analVirgin && pc.libido() <= 50)
		{
			output("\n\nYour body burns for release, but... this isn’t how you imagined the encounter at all. Smiling disingenuously, you cozy up to Sellesy’s crotch, feigning intent to comply. A finger traces up and down the alien’s false phallus, and Sellesy’s eyes close in pleasure. You wrap your hand completely around her oily organs and begin to stroke, masturbating Sellesy as a man while she bites her lips and thrusts her hips. The coils of her clitoral construct flex and stretch, compressing on the downstroke and elongating on the upstroke; her hips move with them on the former, shoving her nerve-laden device through your slippery fist with vigor. In thirty seconds of rubbing her three clitorises at once, the woman has forgotten any intention of plugging your hole, and mere minutes find her arching her back and screaming her joy to the ceiling.");
			output("\n\nSellesy lays still for a long while before speaking again. <i>“That was quite devious. I’ll admit that while it wasn’t as filling as my usual ‘fee’, this wasn’t entirely... pointless.”</i> She thrusts her flagging clitorises in the air one final time to emphasize her last word, and then the three stalks separate and retract into her with startling speed. She gets up and dresses herself, then walks out of the room, leaving you alone to sober up from drunkenness and your own unfulfilled desires.");
			//end, no lust reduction, increase libido");
			pc.libido(1);
			pc.lust(10+rand(5));
			processTime(45);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//(else) - unneeded due to return statement
		output("\n\nAny qualms you have over the change in plans are overriden instantly by the burning desire to be filled again. Climbing into Sellesy’s lap, you hover over her pussy, lowering your [pc.asshole] inch by inch. Her hands come to rest on your hips, guiding you downward. A soft poke announces the meeting of your anus and the alien’s clitoral construct, and you abandon yourself to her guidance. Sellesy greedily pulls you onto her false phallus, jamming her organs into you with an oily slide.");
		//[lose anal virginity, no stretching]
		pc.buttChange(10,true,true,false);
		if(pc.analCapacity() < 100) output(" The fit is tight, but the natural lubrication of the alien’s clitorises smooths the ride, and you’re able to sink all the way until your ass is resting atop her vagina.");
		else output("You have no trouble accommodating her slim clitorises with your well-loved ass, even with all three twisted into a shape more than thrice as thick as a single one; she plunges into you all the way down to the base.");

		output("\n\n<i>“See, isn’t this better?”</i> she cajoles. You can only grunt in response as she chooses that moment to begin thrusting, drawing the coiled clits out of you and shoving them back in, teasing your anal ring with every ridge. Sellesy herself doesn’t seem to inclined to gloat further, occupied by penetrating you with not one but three of the most nerve-laden organs on her body. The oily sex continues apace, tormenting your ass, increasing in pace as Sellesy climbs toward the peak of her climax, fucking you higher and higher into the air as her excitement gets the better of you.");
		output("\n\nYour [pc.asshole] spasms as your orgasm arrives, clamping down and sucking on Sellesy’s tentacles; the woman responds by moaning out her own, balancing you on a pyramid of her upthrust pelvis as her body stiffens. You can feel her clitorises come apart inside you, writhing in your gut as she loses control of the muscular stalks. They stroke your nerves for seven minutes, drawing out Sellesy’s orgasm and your own simply because she can’t get them out of your hot, squeezing insides to wind down without scraping them on the walls of your anus. Eventually she collapses onto the bed, completely giving up and going still, and you fall backwards onto her. Her wet breasts poke into your back, three firm points that press and release as she breathes. Surprisingly, she allows you to remain there without complaint.");
		output("\n\nMore surprisingly, she actually wraps her arms around you. <i>“Told you it was a good plan,”</i> she whispers. You can feel her breath on the back of your neck - calm and even - and you allow it to lull you into a doze, feeling full. You’ve no illusions that Sellesy won’t pull out of you and go back to work while you nap, but for now, the feeling is quite nice.");
		//output("\n\n//end");
	}
	processTime(30);
	if(pc.credits >= 50) pc.credits -= 50;
	pc.orgasm();
	processTime(10+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sellesy's new somethin'
//button name (probably): Strap-on Play
//requires upgrade kit
//cock references use smallest cock that fits Sellesy, unless none do
//tooltip: Let Sellesy play with your adjustable hardlight.
//tooltip disabled, no hardlight equipped or missing upgrade: You need to wear hardlight-enabled underwear with an upgrade kit installed for this.
public function sellesyHardlightScene():void
{
	clearOutput();
	showSellesy(true);
	author("Zeikfried");
	
	var ppSellesy:PregnancyPlaceholder = getSellesyPregContainer();
	
	output("Sellesy’s imperturbability is almost damaged when you tell her what you want to do. <i>“You brought me back here to play with toys");
	if(flags["SELLESY_HL"] != undefined) output(" again");
	output("?”</i> she asks, incredulous. <i>“");
	if(flags["SELLESY_HL"] == undefined) output("Forget it. I’m thirsty and there’s nothing in it for me. When I want to play with toys, I do it in my off-hours.”</i>");
	else output("Remind me again why I should waste my time? I have real clients waiting out there.”</i>");

	output("\n\nWow... usually you would expect flirting from her, or at least a bit of wordplay. Her bluntness must be a symptom - it seems like you’ve really put her out. Your tipsy thoughts hum in circles in your head, trying to catch the words that can explain why she should be interested. Eventually, you just give up and reach for the controls of your hardlight, planning to show her instead.");
	output("\n\nAt your touch, the glowing projection appears, erect and phallic and with an almost-inaudible hum. Sellesy’s frown merely deepens, and she says nothing. You slide your thumb to the length control and extend the cock with a drunk’s finesse, sizing it up until it reaches across the room, halfway to the waitress; her eyebrow flicks upward for a second. Oblivious and inattentive, you touch the girth panel next, swelling the toy through its range until it’s sized for a queen leithan, thicker and more defined than Sellesy’s graceful neck. Dumbly, you peer over the erect, monstrous rod that looks like it would tip you forward were it not completely weightless, and wait for a reaction.");

	//if PC is male or herm
	if(pc.hasCock())
	{
		output("\n\nSellesy folds her arms over her chest, yet her expression softens... a mixed signal? She asks: <i>“And");
		if(flags["SELLESY_HL"] != undefined) output(", once again,");
		output(" why do I want to use a toy, no matter how fantastical, when I can play with you instead?”</i>");

		output("\n\nDrunk as you are, you still recognize the thrust of her question. <i>“");
		if(pc.isBimbo()) output("Um... because it totally lets me, like, feel you just like I was inside you?”</i> you question back, sounding more defensive than intended.");
		else if(pc.isBro()) output("’Cuz it totally transfers the feeling of your cunt right to my junk,”</i> you answer, flatly.");
		else if(pc.isNice()) output("It actually has a feedback system that lets me feel you as if we were making love,”</i> you answer earnestly.");
		else if(pc.isMischievous()) output("I’m just the kind of perv who gets off from this, I guess,”</i> you answer, coyly.");
		else output("Because I want to. Also, it transfers the feedback to me. But mostly because I want to,”</i> you answer.");
	}
	//unsexed/females rejoin here
	output("\n\nThe waitress blinks in surprise, and her body language opens up again; her hands fold behind her as she leans toward you and she finally cracks a grin...or at least a smirk. <i>“Well,”</i> she says, taking a step, <i>“that’s not so bad, then. I suppose it won’t hurt to play for a bit.”</i> She gestures to the bed, and you sit down heavily. Your massive holo-cock flips up and bumps you ");
	if(!pc.isTaur()) output("on the nose");
	else output("on the chest");
	output(", and you work the controls again with your fumbling, drunken hands, sizing it down way too far until it’s a comically-tiny micropenis, no more than a few inches long.");

	output("\n\nSellesy smiles at that, and slips her thumbs into her waistband. Bringing her legs together, she drops her pants and panties, leaning over so far in the process that you can see down her shirt. Now nude from the waist down, she steps out of the discarded panties and gracefully slides onto the bed, taking position atop you. With relish, she tickles the tip of your tiny surrogate dick by colliding her mons into it, grinning all the while you shiver from the feedback. You reach for the hem of her shirt and lift it, but before you can raise it over her breasts, she catches your hand and pulls it back down with a tut. The incorrigible tease pushes you over onto your back, and with an ‘oops’ face, slips your false phallus into her cunt.");
	output("\n\n<i>“You’re so small,”</i> the alien pretends to mock. <i>“I can barely feel it.”</i> You ");
	//(not mean)
	if(!pc.isAss()) output("blush");
	else output("furrow your brow");
	output(" at that, and Sellesy laughs. She raises her arms and knits her hands behind her head; her shirted breasts jut forward as she arches her back and raises herself up on your toy just a bit, and you feel her elongated clits slide free from her body, creeping over your crotch like slippery, muscular worms.");
	output("\n\nSellesy leans until her chest almost touches yours; ");
	if(!pc.isTaur()) output("she grabs your hands and places them on her hips, and ");
	output("her heavily-lidded eyes exude a desire for control. <i>“Relax,”</i> she says. <i>“I’ll take it from here.”</i> Sitting up again, she begins to gyrate on you, pressing the dinky dildo into the sides of her pussy. An electric arc of pleasure shoots up your back.");
	output("\n\nYou relax into Sellesy’s will, and as she pivots her hips you feel a soft touch on your side; her clitoris, peeking between two toned legs, gropes for the girth control. She locates it and presses down; the alien’s oily lubrication soaks through where she drags her slick clit along the panel, sizing up your pencil-dick to a short, fat plug. Your expanding hardlight comes into contact with the outline of Sellesy’s pussy, and your [pc.leg] twitches involuntarily from the feedback... but she doesn’t stop gyrating her hips, and she doesn’t stop staring down at you from under her heavy eyelids.");
	output("\n\nThe woman tunes you as thick as she can accommodate, and releases the control. Her clitors disappears again, into the space between your pelvises, but you continue to feel where it touched: the wet fabric clings to your skin. Another clit squirts through the gap on the opposite side, and finds the length control.");
	output("\n\nYour back tenses");
	//(not taur)
	if(!pc.isTaur()) output(" and your fingers dig in");
	output(" as you feel the holo-cock erect inside Sellesy’s hot pussy, pushing the thick crown over her ridges and folds. Sellesy continues to leer at you, unselfconsciously enjoying the power she has. The dildo jerks to a stop as it bumps into a wall of warm flesh; the alien woman shudders and the pressure on the control panel lessens. After a moment of thought, Sellesy rises up partway and extends it another inch or two. You’re dimly curious why she would make the toy longer than she could take, but you get your answer: fingers of smooth, oily muscle wrap around the base as her clitorises find it, constricting your proxy penis in a lubricated love-sleeve outside the very entrance of her pussy.");
	output("\n\nSo situated, she lowers herself again to make sure the tip still reaches her deepest place; a sigh escapes as it glides through her sensitive clits. Satisfied, she begins to pump in earnest, pushing off of you with her elegant legs and then relaxing to fall on your faux-cock again. She throws her head back, whipping her long hair hard enough to almost brush your [pc.legs] and pushing out her chest");
	if(!pc.isTaur()) output("... you’re enticed by her sweaty, writhing body, wishing to reach up and caress her breasts, but her hands continue to hold yours to her hips, insistent that you help her impale herself on the downstroke");
	output(".");

	//if pc has cock
	if(pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		var sellesyCuntVol:Number = ppSellesy.vaginalCapacity(0);
		
		output("\n\nSellesy shifts her weight and leans back, bending your hardlight away; a clitoris unwinds from the dildo and creeps free, squirming between your sticky pelvises and her sweat-sheened thighs, oily and willful. The red tongue walks along your body like an octopus, wrinkling your [pc.lowerUndergarment], and then curls over your [pc.cock], stroking it through the fabric. You look up at Sellesy, who’s still throwing her head back as she rises and falls - her eye catches yours, and twinkles mischievously.");
		output("\n\nThe flexible organ finds your [pc.cockHead] and pinches it softly, pulling it away from your body and then releasing it to smack against your [pc.legFurScales] again; it dabbles in the stream of precum seeping through the cloth, smearing and spreading it until it mingles with Sellesy’s natural lubrication and your underwear become translucent at the spot. <i>“I wonder...”</i> Sellesy muses, <i>“...how quickly I can make you finish?”</i> The woman’s ominous tone draws you to her face, which is grinning ghoulishly.");
		output("\n\n");
		if(pc.smallestCockVolume() <= sellesyCuntVol) 
		{
			output("No sooner do you take your eye off her crotch than Sellesy’s hips pivot and her remaining clits lurch out for you. One tugs the band of your [pc.lowerUndergarment] away from your waist, and the others dive in, fastening around your [pc.cocks]. Retracting, they drag your [pc.cockNounSimple " + pc.smallestCockIndex() + "] free.");
		}
		else output("No sooner are you distracted by her mischievous eye than her equally-troublesome clits dart out from between your bodies, gathering up your [pc.lowerUndergarment] with soft, oily pinches. With a sharp tug, they pull the waistband down over your enormous bulge, exposing your huge [pc.cockNounSimple].");
		output("\n\nOne of the alien’s clits returns to your photo-cock, reforming the tight ring that buffers her pussy, but the others wrap around your cock");
		if(pc.cockTotal() > 1) output("s");
		output(", bending the shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" and aiming you toward the smooth skin of her thighs as each clit forms a ring of wet muscle. Positioned like this, they pull and massage your crown");
		if(pc.cockTotal() > 1) output("s");
		output(" every time Sellesy rises up. She resumes riding, jerking and fondling while her pussy hilts the dildo and, as always, leering down at you with those amused, expectant eyes.");

		output("\n\nThe tingles at the base of your spine grow completely out of hand under this new abuse, and your orgasm is upon you before your drunken mind can mount a resistance. ");
		if(pc.balls > 1) output("Your [pc.balls] tighten as your body prepares to spill its seed, and Sellesy must feel them bumping against her, ");
		else output("Your face pinches as your body prepares to cum, and Sellesy must interpret your expression correctly, ");
		output("because her clits slide down and squeeze your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" at the base");
		if(pc.cockTotal() > 1) output("s");
		output(" like velvety vises. Push as your body might, only a whisper escapes; you look wide-eyed at the alien for an explanation.");

		if(pc.smallestCockVolume() <= sellesyCuntVol) 
		{
			output("\n\nInstead, she slowly rises up. At the summit, as high as her knees can push her, the third clit wrapped around your dildo flicks it free of her pussy, dragging the crown over her labia and pulling it out of position with a trailer of glistening moisture. Sellesy inches forward, pulling your straining cock");
			if(pc.cockTotal() > 1) output("s");
			output(" into position in its place, then she sinks down again, capturing your [pc.cockNounSimple " + pc.smallestCockIndex() + "]");
			if(pc.cockTotal() > 1) output(" while the second is trapped between her thighs");
			output(". Finally, ready to indulge her hunger, she releases her grip. [pc.Cum] spurts from your too-long-repressed ejaculation, ");
			if(cumQ < 10) output("sprinkling [pc.cumGem]s on Sellesy’s pink insides.");
			else if(cumQ < 1000) output("draping Sellesy’s thirsty cunt with strings of [pc.cumColor].");
			else {
				output("flooding Sellesy’s quim with a torrent of seed that bulges her toned stomach until it washes back out and ");
				if(pc.cockTotal() == 1) output("soaks the sheets and pools in the depression caused by your weight");
				else output("joins the puddle your other prick is making as it paints her belly");
				output(", until you’re nothing but a raft keeping Sellesy afloat on a lake of [pc.cumNoun].");
			}
			if(pc.cockTotal() > 1 && cumQ < 1000) 
			{
				output(" Your other prick ");
				if(cumQ < 10) output("sprinkles");
				else output("squirts");
				output(" its offering onto her smooth, sweat-soaked stomach, pinned outside by her clit.");
			}
			output("\n\nSellesy’s cunt twitches out a mild orgasm as you dump your seed - enough to make her leg shake, but not enough to wipe away her smug, knowing smile. Her calves fold against your body, precluding the possibility of early escape. She’s clearly intent on drinking her fill. Behind the trifornifilia, her clit toys idly with your captive holo-dick, stroking it up and down, forcing aftershocks from your real cock");
			if(pc.cockTotal() > 1) output("s");
			output(". ");
			if(pc.PQ() < 40) output("For ten minutes");
			else output("Until your strength recovers enough to move her");
			output(", she drinks from you");
			if(cumQ >= 1000) output(", dipping into the puddle on the bed with her clits when you go dry");
			output(".");
		}
		//if cockSmallest is too big for sellesy
		else
		{
			output("\n\nInstead, she hooks her shirt and slowly pulls over her head, finally revealing her gorgeous breasts. With a jaunty fingertip, she pulls your [pc.cockNounSimple] toward her while she leans forward, tucking it into her cleavage.");
			output("\n\n<i>“Much cleaner this way,”</i> she says idly. Before you can parse, she rises up, dragging your dick through her tits, and captures the [pc.cockHead] with her mouth; her clit unwinds, and your load boils forth. ");
			//(small/med cum)
			if(cumQ < 1000)
			{
				if(cumQ < 10) output("Sprinkles");
				else output("Strings");
				output(" of [pc.cumNoun] wet Sellesy’s tongue, and she smiles around your shaft.");
			}
			else output(" So much escapes that Sellesy’s cheeks bulge; unable to swallow fast enough and unable to maintain her seal, she spills [pc.cumNoun] down her chin and onto her breasts.");
			output(" The alien releases you when your cock begins to soften, and the last dribble escapes down her chin; she wipes the cum off her face");
			if(cumQ >= 1000) output(" and chest");
			output(" and licks her fingers, then resumes her usual grin.");
		}
		//merge and end cock branches
	}
	//if pc has only vag
	else if(pc.hasVagina())
	{
		output("\n\nSellesy shifts and leans forward, pushing off the dildo slightly; two of her clits unwind and snake their way free, out the back. They find your [pc.vaginas] and begin to rub, teasing out droplets of lubrication that mingle with the alien’s own and turn the fabric sticky-wet. Your [pc.thighs] twitch, trying to close down on the rosy tentacles, and Sellesy’s smile deepens.");
		output("\n\n<i>“I wonder how quickly you can climax,”</i> she muses. Her tone is less than innocent... in fact, it’s downright diabolical. One of the clitorises hooks under the hem and pries the sticky cloth away from your pussy; the other uses the access to touch you intimately, exploring your own clitoris and labia. As you quiver under this new siege, Sellesy resumes gyrating her hips on your thick photonic prong, testing just how the feedback translates her pussy’s convulsions to yours.");
		output("\n\nInterlaced with the trifornifilia, you can’t stop her curious clit from moving beyond fondling and sliding into your pussy, nor would you want to - the hot, writhing tentacle curls and licks at your nerves. Within a few minutes, the internal and external siege brings your pliant, drunken mind to climax; Sellesy must be watching you closely, because she leans forward and");
		if(!pc.isTaur()) output("pins you to the bed with her hands on your shoulders, ");
		output("unwinds all her clits from the dildo, snaking them into your underwear and cupping against your [pc.vaginas]. Pinned to the bed, you writhe out your climax against the waitress, ");
		if(pc.PQ() < 50) output("who easily holds you down");
		else output("who has a demanding job to keep your powerful frame from bucking her off");
		output(". ");
		//(low girlcum)
		if(!pc.isSquirter()) output("Trickles of [pc.girlCum] are squeezed from your [pc.vaginas], only to be routed back in by Sellesy’s wall of pliable, smooth muscle.");
		else output("Gushes of [pc.girlCum] squirt from you, and it’s all Sellesy can do to cup the flow inside with her clits; their oily surface grows more and more [pc.cumVisc] and soon, the trellis begins to leak onto the bed.");

		output("\n\nShe holds you there until your orgasm fades, then lets up your shoulders and leans back again. Reaching a hand down, she cuts off the projector, leaving a sudden void both in her pussy and in your nerves. That space is quickly filled by the new sensation of her clit dipping into your [pc.vaginas], lapping up [pc.girlCumNoun] and transferring it to her own quim. She drinks of you until your juices taper off, then lets you go.");
	}
	//if unsexed
	else
	{
		output("\n\nSellesy rides you hard, testing the limits of your toy’s ability to transfer sensation to your sexless crotch. For five minutes she grinds, but her smile flags as you take stroke after stroke without cumming. She leans back. <i>“You’re a regular rock,”</i> the woman sighs. <i>“You’re also greatly exceeding my interest in this. Let’s wrap it up.”</i>");
		output("\n\nBefore you can ask a question, you feel one of her clits unwind from the projection. It snakes into your underwear and begins to hunt; within seconds, it’s found your [pc.asshole] and is tickling your ring. You jerk, and Sellesy’s smile returns. She pivots her hips again, resuming the torture of your dildo, and the smooth clitoris invades your ass with an oily push and starts to thrust. Using expert flicks at your anal nerves, Sellesy brings you to orgasm; your asshole tries to squeeze, but her tapered tentacle easily eludes you as the alien laughs, leaving you to shake out your orgasm as she stirs your holo-cock for extra amusement.");
	}
	//common ending
	output("\n\n<i>“I suppose that was alright,”</i> Sellesy says. <i>“It was a diversion, at least.”</i> She climbs off of you and redresses, then heads for the door... but not before casting one last glance and smirk back. <i>“Toy" + pc.catDog("-boy", "-poodle") + ",”</i> she says, and slips out of the room.");
	IncrementFlag("SELLESY_HL");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
