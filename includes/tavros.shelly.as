import classes.Items.Miscellaneous.SmallEgg;

public function shellyDisplay():void
{
	if(flags["KNOW_SHELLYS_NAME"] == undefined) userInterface.showName("BUNNY\nWOMAN");
	else userInterface.showName("\nSHELLY");
	userInterface.showBust("SHELLY");
	author("Gardeford");
}

//First encounter
public function ShellyBlurb():void
{
	if(flags["KNOW_SHELLYS_NAME"] == undefined) {
		output("\n\nYou notice a new addition to the bar’s normal clientele; a lone woman stands near the back wall, trying to get the attention of passersby. A closer look reveals her to have tall bunny ears atop her head and a slightly distended belly.");
		addButton(5,"BunnyWoman",investigateSlashShelly);
	}
	else 
	{
		output("\n\nShelly stands at the back of the bar, trying to advertise Ovilium to anyone who will listen.");
		addButton(5,"Shelly",investigateSlashShelly);
	}
}

//[add option “investigate” to list of possible bar happenings]
public function investigateSlashShelly():void
{
	clearOutput();
	shellyDisplay();
	//Investigate
	if(flags["APPROACHED_SHELLY"] == undefined)
	{
		flags["APPROACHED_SHELLY"] = 1;
		output("You decide to check out the bunny girl at the back of the bar. As you get closer you notice she holds a sign with the Xenogen Biotech logo emblazoned across its top. The sign proclaims the advent of a new product, “Ask about Ovilium!”, designed to assist with all situations in which eggs and milk are required. The girl herself seems a little nervous, and as you finally reach her you see part of the reason why. Her clothing consists of a denim bikini that barely conceals her D-cup chest and short shorts that offer even less coverage to her legs. Colorful easter eggs have been tattooed across her pregnant looking stomach. Tall pink bunny ears topped with rainbow, cotton-like puffballs that bob and turn to meet new noises poke out from her head of baby blue hair. In contrast to her hair and ears, her skin is as dark as baker's chocolate. A faint sugary scent emanates from her like perfume, leaving you with a bubbly smile. When she notices you looking her over, she blushes and smiles.");
		output("\n\n<i>“H-hi there, would you care for some info on Xenogen Biotech’s newest product?”</i>");
	}
	//Repeat [shelly]
	else
	{
		output("You walk up to Shelly, and she waves happily when she sees you coming.");
		if(flags["KNOW_SHELLYS_NAME"] == undefined) output("\n\n<i>“Hello again. You need something?”</i>");
		else output("\n\n<i>“Hey [pc.name], you need anything?”</i>");
		output(" she asks with a warm grin.");
	}
	//[talk] [assist] [sex] [leave](at first only talk and leave available, after talk you get assist, after assist cock weilders get other sex)
	clearMenu();
	addButton(0,"Talk",talkToShelly);
	if(flags["TALKED_TO_SHELLY"] == 1) addButton(1,"Assist",assistShellyLaying,undefined,"Assist","Help Shelly lay some eggs.");
	else addDisabledButton(1,"Assist","Assist","You must talk to Shelly before you can assist her with anything.");
	if(flags["ASSISTED_SHELLY_WITH_LAYING"] != undefined)
	{
		if(pc.hasCock() && pc.lust() >= 33) addButton(2,"Sex",sexWithShelly);
		else addDisabledButton(2,"Sex","Sex","Sex with Shelly requires both a phallus and lust to be at or above 33.");
	}
	else addDisabledButton(2,"Sex","Sex","Shelly isn't interested in sex unless you've already \"Assist\"ed her.");
	addButton(14,"Leave",mainGameMenu);
}

//Talk
public function talkToShelly():void
{
	clearOutput();
	shellyDisplay();
	flags["TALKED_TO_SHELLY"] = 1;
	output("You ask the embarrassed bunny-girl about her sign and what she’s doing in the bar. She brightens, looking a little less nervous.");
	output("\n\n<i>“Really? You want to hear about it? Everyone else has just been rude”</i> she says, the relief evident in her voice. You assure her that you’d love to hear about this “Ovilium” stuff.");
	output("\n\n<i>“Awesome! well, it’s the newest product out of Xenogen Biotech’s development labs. It’s supposed to help with lactation for pregnant women with deficient mammary glands who don’t want to use artificially made milk,”</i> she begins, pointing to the reference to milk on the sign.");
	output("\n\nYou ask her if that’s the reason she was chosen for testing, seeing as she looks quite pregnant.");
	output("\n\nThe dark skinned girl averts her eyes and fiddles with her sign for a moment. <i>“Well, kinda, not really. So this was made for people who were already pregnant, but they needed to test it on people who weren’t pregnant as part of medical trials. I signed up because they were offering good money to be part of the trials and living on the fringe planets isn’t always the easiest. So when I get to the testing site, they give me this gummy medicine that looks more like a piece of candy than your average drug. I take it like they tell me to, and at first, nothing really happens, and the scientists are looking kinda bummed out. Then, there's this kinda popping noise and my stomach kinda pokes out to about half the size it is now. The scientists look kinda surprised and run over with a mini X-ray screen. When they hold it over my midsection, lo and behold, I’ve got eggs,”</i> she says, patting her belly with one hand.");
	output("\n\nYou chuckle, telling her that part of her problem might be people thinking she’s just pregnant in a bar. She frowns slightly and removes her hand.");
	output("\n\n<i>“Yeah I guess, but you only got half the story. The trial I was in was more than a year ago. Apparently the test drug they gave me was a little too effective, so whenever these eggs come out more replace them near immediately. The drug that’s going to markets is improved, no permanent effects. They must have realized people would make that mistake like you thought though. The company gave me a job promoting the product, and it's okay money - enough to rent a room on the station,”</i> she says, sounding a little more optimistic at the end.");
	output("\n\nYou mention that you heard her mentioning “layings” and ask what that entails. She blushes and sets the sign off to the side, weaving her fingers together and looking around to see if anyone else is listening.");
	output("\n\n<i>“Well, so i’m full of eggs, and even though they keep coming back, laying is fairly regular. Usually it's just once every couple days, but they can be… coerced to come out sooner. If you get over the fact that they came out of a person, they taste really sweet,”</i> she says with an embarrassed smile. Without really thinking about it, you tell her you’d be happy to assist her with laying eggs if she ever wanted help. The dusky saleswoman’s pink bunny ears turn beet red as she takes in your words, and you realize what you said.");
	output("\n\n<i>“W-well, if you really wanted too, I’d be ok with it. If I just wait for it to happen, they kinda build up and get heavier. My name is Shelly by the way,”</i> she says, brushing her hair away from her face. You aren’t sure if she’s desperate or if you made that big of an impression being the only person who came up and talked to her, but it seems she’d be willing to let you help her, and all that entails. You give her your first name in return and tell her you’ll probably be back soon.");
	flags["KNOW_SHELLYS_NAME"] = 1;
	//pass 30 min
	processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Assist
public function assistShellyLaying():void
{
	flags["ASSISTED_SHELLY_WITH_LAYING"] = 1;
	clearOutput();
	shellyDisplay();
	output("You tell Shelly if she wants some assistance with her egg laying, you’re available now. She nods, grinning and gripping your hand tightly as she pulls you to one of the back rooms. The room is well lit and surprisingly comfortable-looking for what you would expect from a bar like this.");
	output("\n\n<i>“The company gave me this room in case I needed to use it for emergencies. They refurbished it to be a little more inviting than it originally was,”</i> she says as she continues in and stands by the bed. <i>“Ok, so all you need to do is stimulate me... down there.”</i>");
	output("\n\nA blush begins running up her ears, but you tell her not to worry; you’ll have the excess eggs out of her in no time. This calms her down a bit, and she sits on the edge of the bed, reaching behind her back to undo her bra. You take that time to kneel at the foot of the bed next to her, unbuttoning the fastener on her shorts and pulling them down to reveal a pair of gray lace underwear. Not exactly the sexiest you’ve ever seen, but by no means a mood dampener.");
	output("\n\nYou loop your fingers into the elastic band of her undergarments, brushing from her front all the way back to her butt before pulling them down over her legs and feet. It’s hard not to giggle as you see her pink, fluffy cottontail sitting at the base of her spine. You lean forward and kiss her belly, looking up to see her peering down at you through the canyon of her freed, D-cup chest.");
	output("\n\nHer dusky nipples look too inviting to ignore, and you raise your head a little to give one a lick, playing with the other gently. Shelly hums happily as you wrap your lips around her teat, sucking softly. You’re pleasantly surprised when after a moment, a small stream of sweet liquid flows into your mouth. You drink a few spurts of the sugary milk before popping off the tap and licking your lips with a smile. The chocolate bunny girl giggles and leans back onto the bed.");
	output("\n\n<i>“That's another side effect of my prototype drug test. My insides are sweet like candy,”</i> she says seductively, holding open her mons with two fingers, revealing the pink insides and round clit. You move closer, kissing the inside of her thighs as you approach your ultimate goal. Not wanting to leave her in suspense much longer, you give her sex a big pressing lick from bottom to clit, travelling over her entrance and prompting a drawn-out moan from over the dark mountain of her belly.");
	output("\n\nShe wasn’t wrong when she said she was sweet. Her juices taste like candy, and you nearly get a sugar high during the heavy licking you give her dripping cunt. She grips your head with both hands, holding you there as you mash your face against her. You bring your hands up around her sides, playing with her breasts while her hands are occupied. Her milk appears to be slowly leaking as you give her pussy attention, and you rub it over her chest until it feels slick with candied shine.");
	output("\n\nAfter you’ve fully shined her boobs, you bring one hand back down by your mouth, rubbing her ample butt with a milk covered hand. You glide your slippery fingers between her cheeks, rubbing a thumb at the entrance to her asshole. The juices from your licking have further soaked the hole, leaving it ready for penetration. Slowly but surely, you sink your thumb into her, rubbing the hot walls of her anal passage.");
	output("\n\nThe slow penetration is apparently too much for her to handle, and you feel her tense up and howl with pleasure as she cums, covering your face in sweet juices. You continue licking through it, determined to have her spouting eggs by the end of this.");
	output("\n\n<i>“Eggs, coming, here they c-cumm,”</i> she says weakly, tensing and contracting as you kiss around her legs. You hold out a hand as a pink and purple egg suddenly pops out of her snatch. It is followed quickly by a single colored egg and one with polkadots. At first you think they're all you'll get for now, but she tenses one more time as an egg roughly the size of the other three combined slowly pushes through her. By this time, her stomach has noticeably shrunk, and you can see her eyes unfocus as the giant egg leaves her body.");
	output("\n\nYou leave the eggs in a pile on the bed beside her and hoist yourself up to give her a kiss on the lips. Your chocolate-coated, candy treat kisses you back and grins happily. Her entire body glistens with sweet liquids that soak the bedsheets around her and smell like a syrupy perfume.");
	output("\n\n<i>“Thanks for the help, I’d love to do it again some time. You can have one of the eggs if you want. I dont know if the colors are special, but they all taste really good as far as I’ve tested them,”</i> she says, her amber eyes beaming up at you.");
	output("\n\nYou tell her you’d be happy to take one and give her another kiss for good measure. She laughs warmly and tells you she’ll lie here for a half hour or so to recover before she goes back to her job.");
	output("\n\nYou tell her you’ll be sure to come back to help again some time, and leave with one of the smaller eggs in your hand.\n\n");
	processTime(40+rand(10));
	pc.lust(15+rand(3));
	pc.girlCumInMouth(getShellyPregContainer());
	//[gain small egg](just restores small hp amount unless you wanna make it like coc eggs)
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new SmallEgg();
	//Set quantity!
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

public function getShellyPregContainer():PregnancyPlaceholder
{
	var pregContainer:PregnancyPlaceholder = new PregnancyPlaceholder();
	pregContainer.createStatusEffect("Infertile");	
	return pregContainer;
}

//Sex
public function sexWithShelly():void
{
	clearOutput();
	shellyDisplay();
	userInterface.showBust("SHELLY_NUDE");
	var x:int = pc.cockThatFits(100);
	if(x < 0) x = pc.smallestCockIndex();
	processTime(50+rand(10));
	output("You ask Shelly if she’d be up for a little more than just egg-laying assistance. She looks confused for a moment before realization lights up her face.");
	output("\n\n<i>“Really? You’d do that, with me?”</i> she asks, obviously happy but not totally sure.");
	output("\n\nYou tell her there’s nothing you’d rather do more at the moment. She takes your arm, pulling you into the back room nearly bouncing on her heels. When you arrive in the comfortable looking lodging, She turns around, presses herself against you, and ");
	if(!pc.isNude()) output("begins to remove your [pc.gear], brushing her fingers against your [pc.skinFurScales] as your body is revealed");
	else output("begins exploring your body with her hands, unhooking your codex from its belt and laying it gently on the bed");
	output(". You reciprocate her attention, untying her bikini and pulling it away from her dusky D-cups.");

	output("\n\nYour hands crawl down over her egg filled belly, fingers tapping against the brightly colored egg tattoos that dot her skin. Shortly after, you reach her pants, undoing the button and pulling them over her bountiful bottom. She’s wearing pink lace underwear, criminally cute when her small cotton-ball of a tail is factored in, sticking halfway out of the offending garment. Not wanting to leave it cooped up, you loop your thumbs into the lace band and pull her panties down to the floor. After she steps out of them, you turn her around so that her front faces the bed, back to you.");

	//pc non-taur
	if(!pc.isTaur())
	{
		output("\n\nYou grasp your [pc.cock " + x + "], bringing its length to bear and slipping it between her thighs. You hear her gasp with surprised pleasure as the top of your [pc.cock " + x + "] slides over her slit, parting her folds slightly and rubbing her heated entrance. She turns her head to kiss you, and you return it, playing with her tongue and tasting her candy sweet saliva. You rub her legs and grip them, preparing to lift her up.");
		output("\n\nWhen you hoist, you're surprised to find her to be incredibly light and end up nearly flinging her onto the bed. She gives a surprised giggle, not realizing your overzealous lift was an error. You’re happy to go with it, lowering her back until your [pc.cockHead " + x + "] slightly pushes her folds apart, hovering just above penetration. After a few seconds of teasing rubs, you slowly lower her over your [pc.cockNounSimple " + x + "].");
		output("\n\nShe sighs with ecstasy as you fill her, her heated insides clamping down on your [pc.cock " + x + "], until soon ");
		if(pc.cockVolume(x) <= 50) output("you hilt inside her");
		else output("your [pc.cockHead " + x + "] bumps into her cervix");
		output(". You begin bouncing her lightly, moving your hips in time with her body to give her the best experience you can. While you work, she begins kneading her breasts, causing small beads of milk to drip down over her hands as she tugs on the nipples.");
		output("\n\nYou kiss her neck and let one of your hands slide down her leg to play with her budding clit, rubbing the sensitive nub and bringing a lusty moan to your easter treat’s lips. Her moans slowly increase in intensity until she clenches tightly around you, her hands squeezing her breasts so hard that a small spurt of milk sprays onto the bed. Her legs splay out and her toes clench in the air.");
		output("\n\nYou spin her around on your [pc.cock " + x + "] so that she faces you, not giving her a chance to rest. Her stomach is too big to press her against you, but you hold her with one hand at her bottom and the other at her back, giving her ample support as you fuck her silly. You give her a kiss that she returns with gusto, still holding onto her wits despite her intense orgasm.");
		output("\n\nHer legs are now locked around your waist, giving her a better grip to bounce with. She holds your shoulders in both hands, allowing you to use your other hand to play with her breasts. The milk-slicked mounds shine with sugary goodness, and you give one a taste, settling on the nipple to get a drink straight from the source.");
		output("\n\nHolding some of the sweet fluid in your mouth, you kiss Shelly again. She accepts her own sweet milk from you, swallowing the delicious mouthful and leaving a trail of sticky saliva between the two of you when the kiss ends. ");
		if(!pc.hasTailCock()) output("You position the hand holding her ass so that you can stick a finger inside, prompting a pleased gasp from the dusky beauty.");
		else output("You bring your [pc.tailcock] around, sliding it into her well lubed asshole. She gives a pleased gasp as you piston it in and out inside her.");
		output("\n\nYou can practically feel her lust building toward the second orgasm, and can feel your own edging ever closer. She seems to sense this and tries to tell you something.");
		output("\n\n<i>“W-wait! Shoot outside... please,”</i> she says between ecstatic moans. It looks like you have a decision to make.");
		clearMenu();
		addButton(0,"Outside",humanoidsCumOutsideShelly);
		addButton(1,"Inside",humanoidsCumInsideShelly);
	}
	//Pc taur 
	else
	{
		output("\n\nYou silhouette the dark skinned delicacy with your hands, prodding her to bend forward in front of the bed. Shelly bends sensually, holding her pussy open with two fingers and aiming a seductive gaze at you over her shoulder. You lean your upper body over her, grasping a breast in each hand and giving her a deep kiss.");
		output("\n\nAfter a moment you bring your tauric half up, feeling your underside brush over her smooth back till [pc.cock " + x + "] slides like a puzzle piece between her cheeks. You rub back and forth against her, letting her prepare for penetration and teasing her at the same time. She grips [pc.cock " + x + "] with the tips of her fingers, caressing the underside whenever you pull back.");
		output("\n\nYou brace yourself on the bed and look at Shelly. She's holding herself up with one elbow and smiling at you as she polishes your [pc.cockNoun " + x + "] with her hand. The sight is too much to resist, and you rearrange yourself one more time, lining [pc.cock " + x + "] up with the entrance to her vagina. Your [pc.cockHead " + x + "] pushes into her folds, penetrating her easily");
		if(pc.cockVolume(x) <= 50) output(" till you hilt inside her");
		else output(" till your tip bumps into her cervix");
		output(".");
		output("\n\nYou smile as you see her sink onto the bed, eyes fluttering with bliss as she tightly grips the sheets. You begin rhythmically pumping your hips, starting slow enough for her to feel every inch of your length as it glides in and out of her. You gradually pick up the pace, your thrusts gaining speed until you can hear your hips slapping against her plush buttocks.");
		output("\n\nShelly’s tongue has lolled out of her mouth, and you can see a growing stain of sugary milk soaking the sheets, spreading from under her chest. She grunts and moans with every thrust until finally she shouts in a rapturous orgasm. Her insides clasp around [pc.cock " + x + "], wringing you for everything you’ve got. You feel your own end coming, and she seemingly notices your rapidly approaching release.");
		output("\n\n<i>“W-wait! please. Shoot it outside!”</i> she gasps between moans of ecstasy. It looks like you have a decision to make.");
		clearMenu();
		addButton(0,"Outside",taursCumOutsideShelly);
		addButton(1,"Inside",taursCumInsideShelly);
	}

}

//Outside
public function humanoidsCumOutsideShelly():void
{
	clearOutput();
	shellyDisplay();
	userInterface.showBust("SHELLY_NUDE");
	output("Deciding to honor her wish, you piston a few more times for build-up and then gently lay her on the bed, popping your cock out of her pussy just in time. [pc.EachCock] pulses with orgasmic bliss, spurting blasts of [pc.cum] all over her body. A few ropes reach her face, painting parts of her dusky body [pc.cumColor]. She smiles and thanks you for not cumming inside.");

	//if first time: 
	if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] == undefined) output("\n\nCurious, you ask her why not.");
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

//Inside
public function humanoidsCumInsideShelly():void
{
	clearOutput();
	shellyDisplay();
	userInterface.showBust("SHELLY_NUDE");
	output("Ignoring her warning, you piston several times inside her before hilting in preparation for the coming torrent. Your rapid thrusts set off her second orgasm, and you give her a kiss as her body clamps around you. Her tightened insides are too much to resist, and your dick blows its load inside her egg filled womb.");
	if(pc.cockTotal() > 2) output(" Your other cocks spurt wildly over her legs and the underside of her stomach.");
	else if(pc.cockTotal() == 2) output(" Your other cock spurts wildly over her legs and the underside of her stomach.");
	if(pc.hasTailCock()) output(" Your [pc.tailcock] pumps a load of [pc.cum] into her clenching anal cavity.");
	output(" You set her gently onto the bed, popping your spent prick out of her and smiling like an idiot. She punches your shoulder, looking cross with you. You hear a muted bump and notice that her belly looks a little more pregnant than it did before.");
	flags["CAME_INSIDE_SHELLY"] = 1;
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

//Taur
public function taursCumOutsideShelly():void
{
	clearOutput();
	shellyDisplay();
	userInterface.showBust("SHELLY_NUDE");
	output("Deciding to honor her wish, you thrust a few more times, popping out of her velvety box just in time. [pc.EachCock] pulses with orgasmic fervor, spurting your load over her butt and back. Your cum paints her back [pc.cumColor], and a few shots even make it to her neck. She smiles weakly and thanks you for not cumming inside.");
	//(if first time: Curious, you ask her why not.)
	if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] == undefined) output("\n\nCurious, you ask her why not.");
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

//Inside
public function taursCumInsideShelly():void
{
	clearOutput();
	shellyDisplay();
	userInterface.showBust("SHELLY_NUDE");
	output("Ignoring her warning, you piston your powerful hips a few more times, finally hilting inside her in preparation for flooding her with seed. Your thrusts start her orgasm anew, and she bites the sheets, now soaked in sugary fluids. Her tightened insides are too much to resist in the heat of the moment, and your breath catches as you’re overwhelmed by lust. Your dick pumps its load into her egg-stuffed womb.");
	if(pc.cockTotal() > 1)
	{
		output(" Your unused cock");
		if(pc.cockTotal() > 2) output("s spurt");
		else output(" spurts");
		output(" [pc.cum] over the dusky bunny’s butt.");
	}
	output(" You pull out of her, hearing a pop as you leave her passage. She punches your shoulder, looking cross as she rolls over. You hear a muted bump and notice that her belly seems a bit more pregnant than it had before.");
	flags["CAME_INSIDE_SHELLY"] = 1;
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

public function omniShellyEpilogueBlurb():void
{
	//if first time: 
	if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] == undefined)
	{
		output("\n\n<i>“Semen makes the eggs multiply. Thats why it’s not good to cum inside,”</i> she says, patting her stomach.");
		if(flags["CAME_INSIDE_SHELLY"] == undefined) output(" You mention you’re glad you didn’t make it any harder for her, but if you did happen to forget you’d be happy to relieve her of the extra eggs.");
		else output(" You apologize for not listening, but mention that you would be happy to help relieve her of those new extra eggs if she wants.");
	}
	//after first time:
	else
	{
		output("\n\nYou pat your egg-stuffed lover on the stomach and tell her you’d be happy to relieve her of her eggs or just have some fun at any time.");
	}
	flags["CAME_INSIDE_SHELLY"] = undefined;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
